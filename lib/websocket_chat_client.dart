import 'dart:async';
import 'dart:isolate';

import 'package:collection/collection.dart';
import 'package:sputnikn_chat_client/isolated_chat_client_impl.dart';
import 'package:sputnikn_chat_client/model/request/auth_user_request.dart';
import 'package:sputnikn_chat_client/model/request/base_request.dart';
import 'package:sputnikn_chat_client/model/request/create_room_request.dart';
import 'package:sputnikn_chat_client/model/request/download_media_request.dart';
import 'package:sputnikn_chat_client/model/request/list_rooms_request.dart';
import 'package:sputnikn_chat_client/model/request/list_users_request.dart';
import 'package:sputnikn_chat_client/model/request/room_event_message_request.dart';
import 'package:sputnikn_chat_client/model/request/sync_rooms_request.dart';
import 'package:sputnikn_chat_client/model/request/upload_media_request.dart';
import 'package:sputnikn_chat_client/model/response/download_media_response.dart';
import 'package:sputnikn_chat_client/sputnikn_chat_client.dart';

class WebsocketChatClient {
  /// Proxy format: <ip address>:<port>
  WebsocketChatClient(
    String chatServer,
    String mediaServer,
    String databasePath,
    String httpProxy,
  ) {
    _localReceivePort = ReceivePort();
    _receiveSubs = _localReceivePort.listen(
      (dynamic message) {
        if (message is SendPort) {
          _remoteSendPort = message;
          _socketStateSubject.sink
              .add(SocketState(SocketStateType.socketStateTypeReady));
        }
        if (message is QueueResponse) {
          if (message.data is AuthUserResponse) {
            _authenticatedUser = (message.data as AuthUserResponse?)?.detail;
          }
          final completer = _responseQueue[message.responseId];
          if (completer != null) {
            if (message.data == null) {
              completer.completeError(message.error);
            } else {
              completer.complete(message.data);
            }
            _responseQueue.remove(message.responseId);
          } else {
            // TODO(alexsh): do a mechanism to don't process response when Completer is failed in case of timeout
            if (message.data != null) {
              _messageSubject.sink.add(message.data!);
            }
          }
        }
        if (message is ChatError) {
          _errorSubject.sink.add(message);
        }
        if (message is SocketState) {
          _socketStateSubject.sink.add(message);
        }
      },
      onError: (Object message, StackTrace stackTrace) {
        _errorSubject.sink.add(
          ChatError(
            message.toString(),
            stackTrace.toString(),
          ),
        );
      },
    );
    Isolate.spawn(
      IsolatedChatClientImpl.create,
      [
        _localReceivePort.sendPort,
        chatServer,
        mediaServer,
        databasePath,
        httpProxy,
      ],
      errorsAreFatal: false,
    ).then((value) {
      _isolate = value;
    }).onError((message, stackTrace) {
      _errorSubject.sink.add(
        ChatError(
          message?.toString() ?? '',
          stackTrace.toString(),
        ),
      );
    });
  }

  late Isolate _isolate;
  late ReceivePort _localReceivePort;
  static const int _defaultApiRequestTimeout = 3000;
  StreamSubscription? _receiveSubs;
  SendPort? _remoteSendPort;
  final _messageSubject = StreamController<BaseResponse>.broadcast();

  Stream<BaseResponse> get outMessage => _messageSubject.stream;
  final _errorSubject = StreamController<ChatError>.broadcast();

  Stream<ChatError> get outError => _errorSubject.stream;
  final _socketStateSubject = StreamController<SocketState>.broadcast();

  Stream<SocketState> get outSocketState => _socketStateSubject.stream;

  /// Here we store the generated RequestID and its associated Completer
  /// that waits for a response from the server
  final _responseQueue = <int, Completer<BaseResponse>>{};
  int _queueId = 1;

  UserDetail? _authenticatedUser;

  UserDetail? get authenticatedUser => _authenticatedUser;

  void connect() {
    _remoteSendPort?.send('connect');
  }

  void disconnect() {
    _remoteSendPort?.send('stop');
    _remoteSendPort = null;
    _receiveSubs?.cancel();
    _localReceivePort.close();
    _isolate.kill();
    _messageSubject.close();
    _errorSubject.close();
    _socketStateSubject.close();
  }

  Future<AuthUserResponse> authUser(
    String login,
    String password, {
    int timeoutMillis = _defaultApiRequestTimeout,
    bool isOffline = false,
  }) {
    final reqId = _getAndIncrementQueueId();
    final completer = Completer<AuthUserResponse>();
    _responseQueue.putIfAbsent(reqId, () => completer);
    final request = QueueRequest(
      reqId,
      AuthUserRequest(
        login: login,
        password: password,
      ),
      isOffline,
    );
    _remoteSendPort?.send(request);
    return completer.future.timeout(
      Duration(milliseconds: timeoutMillis),
      onTimeout: () {
        return Future.error(
          _failCompleterResult(reqId, 'Auth user timeout'),
          StackTrace.current,
        );
      },
    );
  }

  Future<CreateRoomResponse> createRoom(
    String title,
    String? avatar,
    List<String> memberIds, {
    int timeoutMillis = _defaultApiRequestTimeout,
    bool isOffline = false,
  }) async {
    final reqId = _getAndIncrementQueueId();
    final completer = Completer<CreateRoomResponse>();
    _responseQueue.putIfAbsent(reqId, () => completer);
    final request = QueueRequest(
      reqId,
      CreateRoomRequest(
        title: title,
        avatar: avatar,
        memberIds: memberIds,
      ),
      isOffline,
    );
    _remoteSendPort?.send(request);
    return completer.future.timeout(
      Duration(milliseconds: timeoutMillis),
      onTimeout: () {
        return Future.error(
          _failCompleterResult(reqId, 'Create room timeout'),
          StackTrace.current,
        );
      },
    );
  }

  Future<ListRoomsResponse> listRooms(
    Set<String> roomIds, {
    int timeoutMillis = _defaultApiRequestTimeout,
    bool isOffline = false,
  }) {
    final reqId = _getAndIncrementQueueId();
    final completer = Completer<ListRoomsResponse>();
    _responseQueue.putIfAbsent(reqId, () => completer);
    final request = QueueRequest(
      reqId,
      ListRoomsRequest(
        userId: _authenticatedUser?.userId ?? '',
        roomIds: roomIds,
      ),
      isOffline,
    );
    _remoteSendPort?.send(request);
    return completer.future.timeout(
      Duration(milliseconds: timeoutMillis),
      onTimeout: () {
        return Future.error(
          _failCompleterResult(reqId, 'List rooms timeout'),
          StackTrace.current,
        );
      },
    );
  }

  Future<ListUsersResponse> listUsers({
    int timeoutMillis = _defaultApiRequestTimeout,
    bool isOffline = false,
  }) {
    final reqId = _getAndIncrementQueueId();
    final completer = Completer<ListUsersResponse>();
    _responseQueue.putIfAbsent(reqId, () => completer);
    final request = QueueRequest(
      reqId,
      ListUsersRequest(),
      isOffline,
    );
    _remoteSendPort?.send(request);
    return completer.future.timeout(
      Duration(milliseconds: timeoutMillis),
      onTimeout: () {
        return Future.error(
          _failCompleterResult(reqId, 'List users timeout'),
          StackTrace.current,
        );
      },
    );
  }

  Future<RoomEventMessageResponse> addRoomEventMessage(
    String roomId,
    List<String> attachment,
    String content,
    int version, {
    int timeoutMillis = _defaultApiRequestTimeout,
    bool isOffline = false,
  }) {
    final reqId = _getAndIncrementQueueId();
    final completer = Completer<RoomEventMessageResponse>();
    _responseQueue.putIfAbsent(reqId, () => completer);
    try {
      if (_authenticatedUser == null) {
        throw Exception('User not authorized.');
      }
      final request = QueueRequest(
        reqId,
        RoomEventMessageRequest(
          userId: _authenticatedUser!.userId,
          roomId: roomId,
          attachment: attachment,
          content: content,
          version: version,
        ),
        isOffline,
      );
      _remoteSendPort?.send(request);
    } catch (error, stack) {
      completer.completeError(error, stack);
    }
    return completer.future.timeout(
      Duration(milliseconds: timeoutMillis),
      onTimeout: () {
        return Future.error(
          _failCompleterResult(reqId, 'Add room event message timeout'),
          StackTrace.current,
        );
      },
    );
  }

  Future<SyncRoomsResponse> syncRooms(
    List<SyncRoomFilter> filter, {
    int timeoutMillis = _defaultApiRequestTimeout,
    bool isOffline = false,
  }) {
    final reqId = _getAndIncrementQueueId();
    final completer = Completer<SyncRoomsResponse>();
    _responseQueue.putIfAbsent(reqId, () => completer);
    final request = QueueRequest(
      reqId,
      SyncRoomsRequest(roomFilter: filter),
      isOffline,
    );
    _remoteSendPort?.send(request);
    return completer.future.timeout(
      Duration(milliseconds: timeoutMillis),
      onTimeout: () {
        return Future.error(
          _failCompleterResult(reqId, 'Sync rooms timeout'),
          StackTrace.current,
        );
      },
    );
  }

  Future<UploadMediaResponse> uploadMedia(
    List<MediaContent> files, {
    int timeoutMillis = _defaultApiRequestTimeout,
  }) {
    final reqId = _getAndIncrementQueueId();
    final completer = Completer<UploadMediaResponse>();
    try {
      if (_authenticatedUser == null) {
        throw Exception('User not authorized.');
      }
      _responseQueue.putIfAbsent(reqId, () => completer);
      final request = QueueRequest(
        reqId,
        UploadMediaRequest(
          userId: _authenticatedUser!.userId,
          files: files,
        ),
        false,
      );
      _remoteSendPort?.send(request);
    } catch (error, stack) {
      completer.completeError(error, stack);
    }
    return completer.future.timeout(
      Duration(milliseconds: timeoutMillis),
      onTimeout: () {
        return Future.error(
          _failCompleterResult(reqId, 'Upload media timeout'),
          StackTrace.current,
        );
      },
    );
  }

  Future<DownloadMediaResponse> downloadMedia(
    String contentId, {
    int timeoutMillis = _defaultApiRequestTimeout,
  }) {
    final reqId = _getAndIncrementQueueId();
    final completer = Completer<DownloadMediaResponse>();
    try {
      if (_authenticatedUser == null) {
        throw Exception('User not authorized.');
      }
      _responseQueue.putIfAbsent(reqId, () => completer);
      final request = QueueRequest(
        reqId,
        DownloadMediaRequest(
          userId: _authenticatedUser!.userId,
          contentId: contentId,
        ),
        false,
      );
      _remoteSendPort?.send(request);
    } catch (error, stack) {
      completer.completeError(error, stack);
    }
    return completer.future.timeout(
      Duration(milliseconds: timeoutMillis),
      onTimeout: () {
        return Future.error(
          _failCompleterResult(reqId, 'Download media timeout'),
          StackTrace.current,
        );
      },
    );
  }

  Future<SyncRoomsResponse> smartSyncRooms({
    int timeoutMillis = _defaultApiRequestTimeout,
  }) async {
    final completer = Completer<SyncRoomsResponse>();
    try {
      if (_authenticatedUser == null) {
        throw Exception('User not authorized.');
      }
      final rooms = await listRooms({});
      final syncFilter = rooms.detail.map((room) {
        final member = room.members.firstWhereOrNull(
          (member) => member.userId == _authenticatedUser!.userId,
        );
        final sinceFilter = (member?.lastReadMarker != null)
            ? SinceTimeFilter(
                sinceTime: member!.lastReadMarker!,
                orderType: SinceTimeOrderType.sinceTimeOrderTypeNewest,
              )
            : null;
        return SyncRoomFilter(
          roomId: room.roomId,
          sinceTimeFilter: sinceFilter,
          eventFilter: RoomEventType.roomEventTypeAll,
          eventLimit: 500,
        );
      }).toList();
      final sync = await syncRooms(syncFilter);
      completer.complete(sync);
    } catch (error, stack) {
      completer.completeError(error, stack);
    }
    return completer.future.timeout(
      Duration(milliseconds: timeoutMillis),
      onTimeout: () {
        return Future.error(
          Exception('SmartSyncRooms timeout'),
          StackTrace.current,
        );
      },
    );
  }

  int _getAndIncrementQueueId() {
    final result = _queueId;
    _queueId = _queueId + 1;
    return result;
  }

  Exception _failCompleterResult(int requestId, String message) {
    _responseQueue.remove(requestId);
    return Exception(message);
  }
}
