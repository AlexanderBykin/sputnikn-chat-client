import 'dart:async';
import 'dart:io';
import 'dart:isolate';

import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart' as mime;
import 'package:sputnikn_chat_client/api/api_client.dart';
import 'package:sputnikn_chat_client/database/chat_database.dart';
import 'package:sputnikn_chat_client/database/chat_database_extension.dart';
import 'package:sputnikn_chat_client/generated/chat_message.pb.dart' as proto;
import 'package:sputnikn_chat_client/generated/serializer.dart';
import 'package:sputnikn_chat_client/model/request/base_request.dart';
import 'package:sputnikn_chat_client/model/request/download_media_request.dart';
import 'package:sputnikn_chat_client/model/request/list_rooms_request.dart';
import 'package:sputnikn_chat_client/model/request/room_event_message_request.dart';
import 'package:sputnikn_chat_client/model/request/upload_media_request.dart';
import 'package:sputnikn_chat_client/model/response/download_media_response.dart';
import 'package:sputnikn_chat_client/serializer_base.dart';
import 'package:sputnikn_chat_client/sputnikn_chat_client.dart';
import 'package:sputnikn_chat_client/sputnikn_http_overrides.dart';

class IsolatedChatClientImpl {
  IsolatedChatClientImpl._(
    this.remoteSendPort,
    this.chatServer,
    this.mediaServer,
    String databasePath,
    this.httpProxy,
  ) {
    HttpOverrides.global = SputniknHttpOverrides(httpProxy);
    _serializer = Serializer();
    _mediaService = ApiClient(Dio(BaseOptions(baseUrl: mediaServer)));
    _database = ChatDatabase(NativeDatabase(File(databasePath)));
  }

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
  final _defaultMimeType = 'application/octet-stream';

  static void create(List args) {
    final remoteSendPort = args[0] as SendPort;
    final chatServer = args[1] as String;
    final mediaServer = args[2] as String;
    final databasePath = args[3] as String;
    final httpProxy = args[4] as String;
    final _receivePort = ReceivePort();
    late StreamSubscription receiveSubs;
    final client = IsolatedChatClientImpl._(
      remoteSendPort,
      chatServer,
      mediaServer,
      databasePath,
      httpProxy,
    );
    remoteSendPort.send(_receivePort.sendPort);
    receiveSubs = _receivePort.listen((dynamic message) async {
      try {
        if (message == 'connect') {
          await client.connect();
        } else if (message == 'stop') {
          remoteSendPort
              .send(SocketState(SocketStateType.socketStateTypeDisconnected));
          await receiveSubs.cancel();
          _receivePort.close();
          client.disconnect();
        } else if (message is QueueRequest) {
          if (message.request is UploadMediaRequest ||
              message.request is DownloadMediaRequest) {
            await client.processMediaRequest(message);
          } else if (message.isOffline) {
            await client.processOfflineRequest(message);
          } else {
            await client.processOnlineRequest(message);
          }
        } else {
          throw Exception("Received unknown message '${message.runtimeType}'");
        }
      } catch (error, stack) {
        remoteSendPort.send(
          ChatError(
            error.toString(),
            stack.toString(),
          ),
        );
      }
    });
  }

  Future<bool> connect() async {
    final _completer = Completer<bool>();
    try {
      _webSocket = await WebSocket.connect(chatServer);
      _socketSubs = _webSocket?.listen(processResponse);
      remoteSendPort
          .send(SocketState(SocketStateType.socketStateTypeConnected));
      _completer.complete(true);
    } catch (error, stack) {
      await _socketSubs?.cancel();
      remoteSendPort.send(
        ChatError(
          error.toString(),
          stack.toString(),
        ),
      );
      disconnect();
      Future.delayed(
        Duration(milliseconds: reconnectTimeoutMillis),
        connect,
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
            filename: 'MediaFile_${DateTime.now().millisecondsSinceEpoch}',
          );
        }).toList(),
      );
      remoteSendPort.send(
        QueueResponse(
          request.queueId,
          ApiResponseError.apiResponseErrorNone,
          result,
        ),
      );
    }
    if (request.request is DownloadMediaRequest) {
      final downloadRequest = request.request as DownloadMediaRequest;
      final result = await _downloadMediaContent(
        downloadRequest.userId,
        downloadRequest.contentId,
      );
      remoteSendPort.send(
        QueueResponse(
          request.queueId,
          ApiResponseError.apiResponseErrorNone,
          result,
        ),
      );
    }
  }

  Future<void> processOnlineRequest(QueueRequest request) async {
    final modifiedRequest = await _storeRequestToDatabase(request.request);
    final message = modifiedRequest.toProto();
    final msgId = _serializer.messageToId(message);
    if (msgId <= 0) {
      throw Exception(
        "Can't detect msgId for message '${request.request.runtimeType}'",
      );
    }
    final result = proto.TransportRequest(
      requestId: request.queueId,
      msgId: msgId,
      data: message.writeToBuffer(),
    );
    _webSocket?.add(result.writeToBuffer());
  }

  Future<void> processOfflineRequest(QueueRequest request) async {
    if (request.request is ListRoomsRequest) {
      final data = request.request as ListRoomsRequest;
      final _rooms =
          await _database.getUserRoomsAsRoomDetail(data.userId, data.roomIds);
      remoteSendPort.send(
        QueueResponse(
          request.queueId,
          ApiResponseError.apiResponseErrorNone,
          ListRoomsResponse(detail: _rooms),
        ),
      );
    }
    if (request.request is RoomEventMessageRequest) {
      final data = request.request as RoomEventMessageRequest;
      final nextGeneratedMessageId =
          await _database.getNextGeneratedEventMessageId(data.userId);
      final dateCreation = DateTime.now();
      await _database.upsertEventMessage(
        RoomEventMessageData(
          id: nextGeneratedMessageId.toString(),
          roomId: data.roomId,
          userId: data.userId,
          content: data.content,
          version: data.version,
          clientEventId: nextGeneratedMessageId,
          dateCreate: dateCreation,
          dateEdit: dateCreation,
        ),
      );
      // TODO(alexsh): what should we do with attachments?
      remoteSendPort.send(
        QueueResponse(
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
        ),
      );
    }
    // implement other type of Requests
  }

  Future processResponse(dynamic response) async {
    try {
      if (response is Uint8List) {
        final transport = proto.TransportResponse.fromBuffer(response);
        final msgId = transport.msgId;
        if (msgId <= 0 &&
            transport.errorType ==
                proto.ResponseErrorType.responseErrorTypeNone) return;
        BaseResponse? result;
        final protoMsg = _serializer.bytesToMessage(msgId, transport.data);
        if (protoMsg != null) {
          if (protoMsg is proto.AuthUserReply) {
            final authResponse = AuthUserResponse.fromProto(protoMsg);
            result = authResponse;
          } else if (protoMsg is proto.ListRoomsReply) {
            result = ListRoomsResponse.fromProto(protoMsg);
          } else if (protoMsg is proto.ListUsersReply) {
            result = ListUsersResponse.fromProto(protoMsg);
          } else if (protoMsg is proto.RoomEventMessageReply) {
            result = RoomEventMessageResponse.fromProto(protoMsg);
            // TODO(alexsh): find last user added message and change EventId and also attachments
          } else if (protoMsg is proto.RoomEventReactionReply) {
            result = RoomEventReactionResponse.fromProto(protoMsg);
          } else if (protoMsg is proto.SyncRoomsReply) {
            result = SyncRoomsResponse.fromProto(protoMsg);
          } else if (protoMsg is proto.CreateRoomReply) {
            result = CreateRoomResponse.fromProto(protoMsg);
          } else if (protoMsg is proto.RoomStateChangedReply) {
            result = RoomStateChangedResponse.fromProto(protoMsg);
          } else {
            print('>>> [$runtimeType] unhandled msgId=$msgId');
          }
        }
        await _storeResponseToDatabase(result);
        remoteSendPort.send(
          QueueResponse(
            transport.responseId,
            apiResponseErrorFromProto(transport.errorType),
            result,
          ),
        );
      } else {
        print('>>> [$runtimeType] received unhandled $response');
      }
    } catch (e, stackTrace) {
      remoteSendPort.send(
        ChatError(
          e.toString(),
          stackTrace.toString(),
        ),
      );
    }
  }

  void disconnect() {
    remoteSendPort.send(
      const SocketState(SocketStateType.socketStateTypeDisconnected),
    );
    _webSocket?.close(WebSocketStatus.goingAway);
    _database.close();
  }

  Future<BaseRequest> _storeRequestToDatabase(BaseRequest request) async {
    if (request is RoomEventMessageRequest) {
      final clientEventId =
          await _database.getNextGeneratedEventMessageId(request.userId);
      await _database.upsertEventMessage(
        RoomEventMessageData(
          id: clientEventId.toString(),
          userId: request.userId,
          roomId: request.roomId,
          content: request.content,
          version: request.version,
          clientEventId: clientEventId,
          dateCreate: DateTime.now(),
          dateEdit: DateTime.now(),
        ),
      );
      return request.copyWith(
        clientEventId: clientEventId,
      );
    }
    return request;
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
      final dynamic tmpMediaIds = value.data.data['attachments'];
      final mediaIds =
          (tmpMediaIds is List) ? tmpMediaIds.cast<String>() : <String>[];
      return UploadMediaResponse(
        mediaIds: mediaIds,
      );
    });
  }
}
