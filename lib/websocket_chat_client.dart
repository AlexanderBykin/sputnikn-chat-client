import 'dart:async';
import 'dart:io';
import 'dart:isolate';
import 'package:sputnikn_chat_client/api/api_client.dart';
import 'package:sputnikn_chat_client/sputnikn_chat_client.dart';
import 'package:sputnikn_chat_client/database/chat_database.dart';
import 'package:sputnikn_chat_client/model/request/create_room_request.dart';
import 'package:sputnikn_chat_client/model/response/room_event_system_response.dart';
import 'package:dio/dio.dart';
import 'package:drift/native.dart';
import 'package:sputnikn_chat_client/model/request/download_media_request.dart';
import 'package:sputnikn_chat_client/model/request/upload_media_request.dart';
import 'package:drift/drift.dart';
import 'generated/chat_message.pb.dart' as Proto;
import 'generated/serializer.dart';
import 'model/request/auth_user_request.dart';
import 'model/request/base_request.dart';
import 'model/request/list_rooms_request.dart';
import 'model/request/list_users_request.dart';
import 'model/request/room_event_message_request.dart';
import 'model/request/sync_rooms_request.dart';
import 'model/response/download_media_response.dart';
import 'model/response/upload_media_response.dart';
import 'serializer_base.dart';
import 'package:collection/collection.dart';
import 'database/chat_database_extension.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart' as mime;

class WebsocketChatClient {
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

  /// Proxy format: <ip address>:<port>
  WebsocketChatClient(
    String chatServer,
    String mediaServer,
    String databasePath,
    String httpProxy,
  ) {
    _localReceivePort = ReceivePort();
    _receiveSubs = _localReceivePort.listen((message) {
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
    }, onError: (message, stackTrace) {
      _errorSubject.sink.add(ChatError(
        message.toString(),
        stackTrace.toString(),
      ));
    });
    Isolate.spawn(
      _IsolatedChatClient.create,
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
      _errorSubject.sink.add(ChatError(
        message?.toString() ?? "",
        stackTrace.toString(),
      ));
    });
  }

  void connect() {
    _remoteSendPort?.send("connect");
  }

  void disconnect() {
    _remoteSendPort?.send("stop");
    _remoteSendPort = null;
    _receiveSubs?.cancel();
    _localReceivePort.close();
    _isolate.kill(priority: Isolate.beforeNextEvent);
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
        throw _failCompleterResult(reqId, "Auth user timeout");
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
        throw _failCompleterResult(reqId, "Create room timeout");
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
        userId: _authenticatedUser?.userId ?? "",
        roomIds: roomIds,
      ),
      isOffline,
    );
    _remoteSendPort?.send(request);
    return completer.future.timeout(
      Duration(milliseconds: timeoutMillis),
      onTimeout: () {
        throw _failCompleterResult(reqId, "List rooms timeout");
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
        throw _failCompleterResult(reqId, "List users timeout");
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
        throw Exception("User not authorized.");
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
        throw _failCompleterResult(reqId, "Add room event message timeout");
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
        throw _failCompleterResult(reqId, "Sync rooms timeout");
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
        throw Exception("User not authorized.");
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
        throw _failCompleterResult(reqId, "Upload media timeout");
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
        throw Exception("User not authorized.");
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
        throw _failCompleterResult(reqId, "Download media timeout");
      },
    );
  }

  Future<SyncRoomsResponse> smartSyncRooms({
    int timeoutMillis = _defaultApiRequestTimeout,
  }) async {
    final completer = Completer<SyncRoomsResponse>();
    try {
      if (_authenticatedUser == null) {
        throw Exception("User not authorized.");
      }
      final rooms = await listRooms({});
      final syncFilter = rooms.detail.map((room) {
        final member = room.members.firstWhereOrNull(
            (member) => member.userId == _authenticatedUser!.userId);
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
        throw Exception("SmartSyncRooms timeout");
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

class _IsolatedChatClient {
  WebSocket? _webSocket;
  final SendPort remoteSendPort;
  final String chatServer;
  final String mediaServer;
  final String httpProxy;
  StreamSubscription? _socketSubs;
  late SerializerBase _serializer;
  late ChatDatabase _database;
  late ApiClient _mediaService;
  final int reconnectTimeoutMillis = 3000;
  final _defaultMimeType = "application/octet-stream";

  static void create(List args) {
    final remoteSendPort = args[0] as SendPort;
    final chatServer = args[1] as String;
    final mediaServer = args[2] as String;
    final databasePath = args[3] as String;
    final httpProxy = args[4] as String;
    final _receivePort = ReceivePort();
    late StreamSubscription receiveSubs;
    final client = _IsolatedChatClient._(
      remoteSendPort,
      chatServer,
      mediaServer,
      databasePath,
      httpProxy,
    );
    remoteSendPort.send(_receivePort.sendPort);
    receiveSubs = _receivePort.listen((message) async {
      try {
        if (message == "connect") {
          client.connect();
        } else if (message == "stop") {
          remoteSendPort
              .send(SocketState(SocketStateType.socketStateTypeDisconnected));
          receiveSubs.cancel();
          _receivePort.close();
          client.disconnect();
        } else if (message is QueueRequest) {
          if (message.request is UploadMediaRequest ||
              message.request is DownloadMediaRequest) {
            await client.processMediaRequest(message);
          } else if (message.isOffline) {
            client.processOfflineRequest(message);
          } else {
            client.processOnlineRequest(message);
          }
        } else {
          throw Exception("Received unknown message '${message.runtimeType}'");
        }
      } catch (error, stack) {
        remoteSendPort.send(ChatError(
          error.toString(),
          stack.toString(),
        ));
      }
    });
  }

  _IsolatedChatClient._(
    this.remoteSendPort,
    this.chatServer,
    this.mediaServer,
    String databasePath,
    this.httpProxy,
  ) {
    HttpOverrides.global = _MyHttpOverrides(httpProxy);
    _serializer = Serializer();
    _mediaService = ApiClient(Dio(BaseOptions(baseUrl: mediaServer)));
    _database = ChatDatabase(NativeDatabase(File(databasePath)));
  }

  Future<bool> connect() async {
    final _completer = Completer<bool>();
    try {
      _webSocket = await WebSocket.connect(chatServer);
      _socketSubs = _webSocket?.listen((event) => processResponse(event));
      remoteSendPort
          .send(SocketState(SocketStateType.socketStateTypeConnected));
      _completer.complete(true);
    } catch (error, stack) {
      _socketSubs?.cancel();
      remoteSendPort.send(ChatError(
        error.toString(),
        stack.toString(),
      ));
      disconnect();
      Future.delayed(
        Duration(milliseconds: reconnectTimeoutMillis),
        () {
          connect();
        },
      );
      _completer.complete(false);
    }
    return _completer.future;
  }

  Future<void> processMediaRequest(QueueRequest request) async {
    if (request.request is UploadMediaRequest) {
      final uploadRequest = request.request as UploadMediaRequest;
      final result = await _uploadMediaContent(
        uploadRequest.userId,
        uploadRequest.files.map((e) {
          final mediaType = mime.lookupMimeType(
            'some-media',
            headerBytes: e.bytes.take(16).toList(),
          );
          return MultipartFile.fromBytes(
            e.bytes,
            contentType:
                MediaType.parse(e.contentType ?? mediaType ?? _defaultMimeType),
            filename: "MediaFile_${DateTime.now().millisecondsSinceEpoch}",
          );
        }).toList(),
      );
      remoteSendPort.send(QueueResponse(
        request.queueId,
        ApiResponseError.apiResponseErrorNone,
        result,
      ));
    }
    if (request.request is DownloadMediaRequest) {
      final downloadRequest = request.request as DownloadMediaRequest;
      final result = await _downloadMediaContent(
        downloadRequest.userId,
        downloadRequest.contentId,
      );
      remoteSendPort.send(QueueResponse(
        request.queueId,
        ApiResponseError.apiResponseErrorNone,
        result,
      ));
    }
  }

  void processOnlineRequest(QueueRequest request) async {
    await _storeRequestToDatabase(request.request);
    final message = request.request.toProto();
    final msgId = _serializer.messageToId(message);
    if (msgId <= 0) return;
    final result = Proto.TransportRequest(
      requestId: request.queueId,
      msgId: msgId,
      data: message.writeToBuffer(),
    );
    _webSocket?.add(result.writeToBuffer());
  }

  void processOfflineRequest(QueueRequest request) async {
    if (request.request is ListRoomsRequest) {
      final data = request.request as ListRoomsRequest;
      final _rooms =
          await _database.getUserRoomsAsRoomDetail(data.userId, data.roomIds);
      remoteSendPort.send(QueueResponse(
        request.queueId,
        ApiResponseError.apiResponseErrorNone,
        ListRoomsResponse(detail: _rooms),
      ));
    }
    if (request.request is RoomEventMessageRequest) {
      final data = request.request as RoomEventMessageRequest;
      final nextGeneratedMessageId =
          await _database.getNextGeneratedEventMessageId(data.userId);
      final dateCreation = DateTime.now();
      await _database.upsertEventMessage(RoomEventMessageData(
        id: nextGeneratedMessageId.toString(),
        roomId: data.roomId,
        userId: data.userId,
        content: data.content,
        version: data.version,
        clientEventId: nextGeneratedMessageId,
        dateCreate: dateCreation,
        dateEdit: dateCreation,
      ));
      // TODO(alexsh): what should we do with attachments?
      remoteSendPort.send(QueueResponse(
        request.queueId,
        ApiResponseError.apiResponseErrorNone,
        RoomEventMessageResponse(
          detail: RoomEventMessageDetail(
            eventId: nextGeneratedMessageId.toString(),
            roomId: data.roomId,
            senderId: data.userId,
            clientEventId: nextGeneratedMessageId,
            version: data.version,
            attachment: [],
            reaction: [],
            content: data.content,
            createTimestamp: dateCreation,
            updateTimestamp: dateCreation,
          ),
        ),
      ));
    }
    // implement other type of Requests
  }

  Future processResponse(dynamic response) async {
    try {
      if (response is Uint8List) {
        final transport = Proto.TransportResponse.fromBuffer(response);
        final msgId = transport.msgId;
        if (msgId <= 0 &&
            transport.errorType ==
                Proto.ResponseErrorType.responseErrorTypeNone) return;
        BaseResponse? result;
        final protoMsg = _serializer.bytesToMessage(msgId, transport.data);
        if (protoMsg != null) {
          if (protoMsg is Proto.AuthUserReply) {
            final authResponse = AuthUserResponse.fromProto(protoMsg);
            result = authResponse;
          } else if (protoMsg is Proto.ListRoomsReply) {
            result = ListRoomsResponse.fromProto(protoMsg);
          } else if (protoMsg is Proto.ListUsersReply) {
            result = ListUsersResponse.fromProto(protoMsg);
          } else if (protoMsg is Proto.RoomEventMessageReply) {
            result = RoomEventMessageResponse.fromProto(protoMsg);
            // TODO(alexsh): find last user added message and change EventId and also attachments
          } else if (protoMsg is Proto.RoomEventReactionReply) {
            result = RoomEventReactionResponse.fromProto(protoMsg);
          } else if (protoMsg is Proto.SyncRoomsReply) {
            result = SyncRoomsResponse.fromProto(protoMsg);
          } else if (protoMsg is Proto.CreateRoomReply) {
            result = CreateRoomResponse.fromProto(protoMsg);
          } else if (protoMsg is Proto.RoomStateChangedReply) {
            result = RoomStateChangedResponse.fromProto(protoMsg);
          } else {
            print(">>> [$runtimeType] unhandled msgId=$msgId");
          }
        }
        await _storeResponseToDatabase(result);
        remoteSendPort.send(QueueResponse(
          transport.responseId,
          apiResponseErrorFromProto(transport.errorType),
          result,
        ));
      } else {
        print(">>> [$runtimeType] received unhandled $response");
      }
    } catch (e, stackTrace) {
      remoteSendPort.send(ChatError(
        e.toString(),
        stackTrace.toString(),
      ));
    }
  }

  void disconnect() {
    remoteSendPort
        .send(SocketState(SocketStateType.socketStateTypeDisconnected));
    _webSocket?.close(WebSocketStatus.goingAway);
    _database.close();
  }

  Future<void> _storeRequestToDatabase(BaseRequest request) async {
    if (request is RoomEventMessageRequest) {
      request.clientEventId =
          await _database.getNextGeneratedEventMessageId(request.userId);
      await _database.upsertEventMessage(RoomEventMessageData(
        id: request.clientEventId!.toString(),
        userId: request.userId,
        roomId: request.roomId,
        content: request.content,
        version: request.version,
        clientEventId: request.clientEventId!,
        dateCreate: DateTime.now(),
        dateEdit: DateTime.now(),
      ));
    }
  }

  Future<void> _storeResponseToDatabase(BaseResponse? response) async {
    if (response is ListUsersResponse) {
      await _database.storeUsers(response.users);
    }
    if (response is ListRoomsResponse) {
      await _database.storeRoomDetails(response.detail);
    }
    if (response is CreateRoomResponse) {
      await _database.storeRoomDetails([response.detail]);
    }
    if (response is RoomEventMessageResponse) {
      await _database.storeRoomEventMessages([response.detail]);
    }
    if (response is RoomEventSystemResponse) {
      await _database.storeRoomEventSystems([response.detail]);
    }
    if (response is RoomStateChangedResponse) {
      await _database.storeRoomDetails([response.detail]);
    }
    if (response is SyncRoomsResponse) {
      await _database.storeRoomEventMessages(response.messageEvents);
      await _database.storeRoomEventSystems(response.systemEvents);
    }

    return Future.value();
  }

  Future<DownloadMediaResponse> _downloadMediaContent(
    String userId,
    String contentId,
  ) {
    return _mediaService.download(userId, contentId).then((value) {
      return DownloadMediaResponse(
        content: MediaContent(
          contentType:
              (value.response.headers[HttpHeaders.contentTypeHeader]!).first,
          bytes: value.data,
        ),
      );
    });
  }

  Future<UploadMediaResponse> _uploadMediaContent(
    String userId,
    List<MultipartFile> files,
  ) {
    return _mediaService.upload(userId, files).then((value) {
      final tmpMediaIds = value.data.data["attachments"];
      final List<String> mediaIds =
          (tmpMediaIds is List) ? tmpMediaIds.cast<String>() : [];
      return UploadMediaResponse(
        mediaIds: mediaIds,
      );
    });
  }
}

class _MyHttpOverrides extends HttpOverrides {
  final String httpProxy;

  _MyHttpOverrides(this.httpProxy);

  @override
  HttpClient createHttpClient(SecurityContext? context) {
    // just for ignore checking self signed certificate
    final client = super.createHttpClient(context);
    if (httpProxy.isNotEmpty) {
      client.findProxy = (uri) => "PROXY $httpProxy;";
    }
    client.badCertificateCallback = (cert, host, port) {
      return true;
    };
    return client;
  }
}
