import 'dart:async';
import 'dart:isolate';

import 'package:protobuf/protobuf.dart';
import 'package:sputnikn_chat_client/isolated_chat_client.dart';
import 'package:sputnikn_chat_client/sputnikn_chat_client.dart';

class ChatClient {
  ChatClient({
    required this.databasePath,
    required this.chatServerHost,
    required this.chatServerPort,
    required this.mediaServer,
    required this.httpProxy,
  });

  static const int _minQueue = -10000000;
  static const int _maxQueue = 10000000;
  static const int _defaultApiRequestTimeout = 3000;

  final String databasePath;
  final String chatServerHost;
  final int chatServerPort;
  final String mediaServer;
  final String httpProxy;
  final _responseQueue = <int, Completer<QueueResponse>>{};
  final _localReceivePort = ReceivePort();
  final _messageSubject = StreamController<GeneratedMessage>.broadcast();
  final _errorSubject = StreamController<ChatError>.broadcast();
  int _queueId = _minQueue;
  Isolate? _isolate;
  SendPort? _remoteSendPort;
  StreamSubscription<dynamic>? _receiveSubs;

  Stream<GeneratedMessage> get messageStream => _messageSubject.stream;
  Stream<ChatError> get errorStream => _errorSubject.stream;

  Future<void> init() async {
    _receiveSubs = _localReceivePort.listen(_onReceiveMessage);
    _isolate = await Isolate.spawn(
      IsolatedChatClient.create,
      IsolatedChatClientArgs(
        remoteSendPort: _localReceivePort.sendPort,
        databasePath: databasePath,
        chatServerHost: chatServerHost,
        chatServerPort: chatServerPort,
        mediaServer: mediaServer,
        httpProxy: httpProxy,
      ),
    );
  }

  Future<void> close() async {
    _remoteSendPort?.send('stop');
    await _receiveSubs?.cancel();
    _isolate?.kill(priority: Isolate.immediate);
    await _messageSubject.close();
    await _errorSubject.close();
  }

  void _onReceiveMessage(dynamic message) {
    if (message is SendPort) {
      _remoteSendPort = message;
    } else if (message is QueueResponse) {
      final completer = _responseQueue[message.responseId];
      if (completer != null) {
        if (message.error != null) {
          completer.completeError(message.error!);
        } else {
          completer.complete(message);
        }
        _responseQueue.remove(message.responseId);
      } else {
        if (message.data != null) {
          if (message.data is GeneratedMessage) {
            _messageSubject.sink.add(message.data! as GeneratedMessage);
          }
        }
      }
    } else if (message is ChatError) {
      _errorSubject.sink.add(message);
    } else {
      _errorSubject.sink.add(
        ChatError(
          'Unhandled message "${message.runtimeType}"',
          StackTrace.current.toString(),
        ),
      );
    }
  }

  Future<AuthUserResponse> authUser(
    String login,
    String password, {
    int timeoutMillis = _defaultApiRequestTimeout,
    bool isOffline = false,
  }) {
    final reqId = _getAndIncrementQueueId();
    final completer = Completer<QueueResponse>();
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
    return completer.future
        .then(_failQueueOrResult<AuthUserResponse>)
        .timeout(
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
    final completer = Completer<QueueResponse>();
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
    return completer.future
        .then(_failQueueOrResult<CreateRoomResponse>)
        .timeout(
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
    final completer = Completer<QueueResponse>();
    _responseQueue.putIfAbsent(reqId, () => completer);
    final request = QueueRequest(
      reqId,
      ListRoomsRequest(
        roomIds: roomIds,
      ),
      isOffline,
    );
    _remoteSendPort?.send(request);
    return completer.future
        .then(_failQueueOrResult<ListRoomsResponse>)
        .timeout(
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
    final completer = Completer<QueueResponse>();
    _responseQueue.putIfAbsent(reqId, () => completer);
    final request = QueueRequest(
      reqId,
      ListUsersRequest(),
      isOffline,
    );
    _remoteSendPort?.send(request);
    return completer.future
        .then(_failQueueOrResult<ListUsersResponse>)
        .timeout(
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
    final completer = Completer<QueueResponse>();
    _responseQueue.putIfAbsent(reqId, () => completer);
    try {
      final request = QueueRequest(
        reqId,
        RoomEventMessageRequest(
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
    return completer.future
        .then(_failQueueOrResult<RoomEventMessageResponse>)
        .timeout(
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
    final completer = Completer<QueueResponse>();
    _responseQueue.putIfAbsent(reqId, () => completer);
    final request = QueueRequest(
      reqId,
      SyncRoomsRequest(roomFilter: filter),
      isOffline,
    );
    _remoteSendPort?.send(request);
    return completer.future
        .then(_failQueueOrResult<SyncRoomsResponse>)
        .timeout(
          Duration(milliseconds: timeoutMillis),
          onTimeout: () {
            return Future.error(
              _failCompleterResult(reqId, 'Sync rooms timeout'),
              StackTrace.current,
            );
          },
        );
  }

  Future<SyncRoomsResponse> smartSyncRooms({
    int timeoutMillis = _defaultApiRequestTimeout,
    bool isOffline = false,
  }) async {
    final reqId = _getAndIncrementQueueId();
    final completer = Completer<QueueResponse>();
    _responseQueue.putIfAbsent(reqId, () => completer);
    final request = QueueRequest(
      reqId,
      SmartSyncRoomsRequest(),
      isOffline,
    );
    _remoteSendPort?.send(request);
    return completer.future
        .then(_failQueueOrResult<SyncRoomsResponse>)
        .timeout(
          Duration(milliseconds: timeoutMillis),
          onTimeout: () {
            return Future.error(
              _failCompleterResult(reqId, 'Smart sync rooms timeout'),
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
    final completer = Completer<QueueResponse>();
    try {
      _responseQueue.putIfAbsent(reqId, () => completer);
      final request = QueueRequest(
        reqId,
        UploadMediaRequest(
          files: files,
        ),
        false,
      );
      _remoteSendPort?.send(request);
    } catch (error, stack) {
      completer.completeError(error, stack);
    }
    return completer.future
        .then(_failQueueOrResult<UploadMediaResponse>)
        .timeout(
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
    final completer = Completer<QueueResponse>();
    try {
      _responseQueue.putIfAbsent(reqId, () => completer);
      final request = QueueRequest(
        reqId,
        DownloadMediaRequest(
          contentId: contentId,
        ),
        false,
      );
      _remoteSendPort?.send(request);
    } catch (error, stack) {
      completer.completeError(error, stack);
    }
    return completer.future
        .then(_failQueueOrResult<DownloadMediaResponse>)
        .timeout(
          Duration(milliseconds: timeoutMillis),
          onTimeout: () {
            return Future.error(
              _failCompleterResult(reqId, 'Download media timeout'),
              StackTrace.current,
            );
          },
        );
  }

  int _getAndIncrementQueueId() {
    final result = _queueId;
    if (_queueId + 1 > _maxQueue) {
      _queueId = _minQueue;
    } else {
      _queueId = _queueId + 1;
    }
    return result;
  }

  Future<TR> _failQueueOrResult<TR>(QueueResponse response) {
    if (response.error != null) {
      return Future.error(response.error!);
    }
    return Future.value(response.data! as TR);
  }

  Exception _failCompleterResult(int requestId, String message) {
    _responseQueue.remove(requestId);
    return Exception(message);
  }
}
