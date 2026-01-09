import 'dart:async';
import 'dart:io';
import 'dart:isolate';

import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:grpc/grpc.dart';
import 'package:http/http.dart' as http;
import 'package:mime/mime.dart' as mime;
import 'package:protobuf/protobuf.dart';
import 'package:sputnikn_chat_client/api/api_client.dart';
import 'package:sputnikn_chat_client/common/extensions/extensions.dart';
import 'package:sputnikn_chat_client/database/chat_database.dart';
import 'package:sputnikn_chat_client/database/chat_database_extension.dart';
import 'package:sputnikn_chat_client/generated/contract.pbgrpc.dart';
import 'package:sputnikn_chat_client/sputnikn_chat_client.dart';
import 'package:sputnikn_chat_client/sputnikn_http_overrides.dart';
import 'package:uuid/uuid.dart';

class IsolatedChatClientArgs {
  const IsolatedChatClientArgs(
    this.databasePath,
    this.remoteSendPort,
    this.chatServerHost,
    this.chatServerPort,
    this.mediaServer,
    this.httpProxy,
  );

  final String databasePath;
  final SendPort remoteSendPort;
  final String chatServerHost;
  final int chatServerPort;
  final String mediaServer;
  final String httpProxy;
}

class IsolatedChatClientImpl {
  IsolatedChatClientImpl._(
    this.remoteSendPort,
    this.chatServerHost,
    this.chatServerPort,
    this.mediaServer,
    String databasePath,
    this.httpProxy,
  ) {
    HttpOverrides.global = SputniknHttpOverrides(httpProxy);
    _mediaService = ApiClient(Dio(BaseOptions(baseUrl: mediaServer)));
    _database = ChatDatabase(NativeDatabase(File(databasePath)));
    final channel = ClientChannel(
      chatServerHost,
      port: chatServerPort,
      options: ChannelOptions(
        credentials: const ChannelCredentials.insecure(),
        codecRegistry: CodecRegistry(
          codecs: const [GzipCodec(), IdentityCodec()],
        ),
      ),
    );
    _chatClient = ChatServiceClient(channel);
  }

  final SendPort remoteSendPort;
  final String chatServerHost;
  final int chatServerPort;
  final String mediaServer;
  final String httpProxy;
  final _uuid = const Uuid();
  late ChatDatabase _database;
  late ApiClient _mediaService;
  late ChatServiceClient _chatClient;
  final _defaultMimeType = 'application/octet-stream';

  static void create(IsolatedChatClientArgs args) {
    final receivePort = ReceivePort();
    late StreamSubscription<dynamic> receiveSubs;
    final client = IsolatedChatClientImpl._(
      args.remoteSendPort,
      args.chatServerHost,
      args.chatServerPort,
      args.mediaServer,
      args.databasePath,
      args.httpProxy,
    );
    args.remoteSendPort.send(receivePort.sendPort);
    receiveSubs = receivePort.listen((dynamic message) async {
      try {
        if (message == 'connect') {
          // TODO: removed as unnecessary
        } else if (message == 'stop') {
          receivePort.close();
          await receiveSubs.cancel();
          await client.close();
        } else if (message is QueueRequest) {
          if (message.data is UploadMediaRequest || message.data is DownloadMediaRequest) {
            await client.processMediaRequest(message);
          } else {
            await client.processRequest(message);
          }
        } else {
          throw Exception("Received unknown message '${message.runtimeType}'");
        }
      } catch (error, stack) {
        args.remoteSendPort.send(ChatError(error.toString(), stack.toString()));
      }
    });
  }

  Future<void> processMediaRequest(QueueRequest request) async {
    if (request.data is UploadMediaRequest) {
      final uploadRequest = request.data as UploadMediaRequest;
      final result = await _uploadMediaContent(
        uploadRequest.userId,
        uploadRequest.files.map((e) {
          final mediaType = mime.lookupMimeType(
            'some-media',
            headerBytes: e.bytes.take(16).toList(),
          );
          return MultipartFile.fromBytes(
            e.bytes,
            contentType: http.MediaType.parse(e.contentType ?? mediaType ?? _defaultMimeType),
            filename: 'MediaFile_${DateTime.now().millisecondsSinceEpoch}',
          );
        }).toList(),
      );
      remoteSendPort.send(QueueResponse.success(request.queueId, result));
    }
    if (request.data is DownloadMediaRequest) {
      final downloadRequest = request.data as DownloadMediaRequest;
      final result = await _downloadMediaContent(
        downloadRequest.userId,
        downloadRequest.contentId,
      );
      remoteSendPort.send(QueueResponse.success(request.queueId, result));
    }
  }

  Future<void> processRequest(QueueRequest request) async {
    await _storeRequestToDatabase(request.data);
    GeneratedMessage? response;
    if (request.data is AuthUserRequest) {
      response = await _chatClient.authUser(request.data as AuthUserRequest);
    }
    if (request.data is ListUsersRequest) {
      final data = request.data as ListUsersRequest;
      if (request.isOffline) {
        //
      } else {
        response = await _chatClient.listUsers(data);
      }
    }
    if (request.data is ListRoomsRequest) {
      final data = request.data as ListRoomsRequest;
      if (request.isOffline) {
        final rooms = await _database.getUserRoomsAsRoomDetail(data.userId, data.roomIds.toSet());
        remoteSendPort.send(QueueResponse.success(request.queueId, ListRoomsResponse(detail: rooms)));
      } else {
        response = await _chatClient.listRooms(data);
      }
    }
    if (request.data is SyncRoomsRequest) {
      final data = request.data as SyncRoomsRequest;
      if (request.isOffline) {
        //
      } else {
        response = await _chatClient.syncRooms(data);
      }
    }
    if (request.data is RoomReadMarkerRequest) {
      final data = request.data as RoomReadMarkerRequest;
      if (request.isOffline) {
        //
      } else {
        response = await _chatClient.setRoomReadMarker(data);
      }
    }
    if (request.data is CreateRoomRequest) {
      final data = request.data as CreateRoomRequest;
      if (request.isOffline) {
        //
      } else {
        response = await _chatClient.createRoom(data);
      }
    }
    if (request.data is InviteRoomMemberRequest) {
      final data = request.data as InviteRoomMemberRequest;
      if (request.isOffline) {
        //
      } else {
        response = await _chatClient.inviteRoomMember(data);
      }
    }
    if (request.data is RemoveRoomMemberRequest) {
      final data = request.data as RemoveRoomMemberRequest;
      if (request.isOffline) {
        //
      } else {
        response = await _chatClient.removeRoomMember(data);
      }
    }
    if (request.data is RoomEventMessageRequest) {
      final data = request.data as RoomEventMessageRequest;
      if (request.isOffline) {
        final dateCreation = DateTime.now();
        await _database.upsertEventMessage(
          RoomEventMessageData(
            id: _uuid.v4(),
            roomId: data.roomId,
            userId: data.userId,
            content: data.content,
            version: data.version,
            dateCreate: dateCreation,
            dateEdit: dateCreation,
          ),
        );
        // TODO(alexsh): what should we do with attachments?
        remoteSendPort.send(
          QueueResponse.success(
            request.queueId,
            RoomEventMessageResponse(
              detail: RoomEventMessageDetail(
                eventId: _uuid.v4(),
                roomId: data.roomId,
                senderId: data.userId,
                version: data.version,
                attachment: [],
                reaction: [],
                content: data.content,
                createdAt: dateCreation.toTimestamp(),
                updatedAt: dateCreation.toTimestamp(),
              ),
            ),
          ),
        );
      } else {
        response = await _chatClient.addRoomMessage(data);
      }
    }
    if (request.data is RoomEventMessageReactionRequest) {
      final data = request.data as RoomEventMessageReactionRequest;
      if (request.isOffline) {
        //
      } else {
        response = await _chatClient.addRoomMessageReaction(data);
      }
    }
    if (response != null) {
      await _storeResponseToDatabase(response);
      remoteSendPort.send(QueueResponse.success(request.queueId, response));
    }
  }

  Future<void> close() async {
    // TODO: how to disconnect client?
    await _database.close();
  }

  Future<Object> _storeRequestToDatabase(Object request) async {
    if (request is RoomEventMessageRequest) {
      await _database.upsertEventMessage(
        RoomEventMessageData(
          id: _uuid.v4(),
          userId: request.userId,
          roomId: request.roomId,
          content: request.content,
          version: request.version,
          dateCreate: DateTime.now(),
          dateEdit: DateTime.now(),
        ),
      );
    }
    return request;
  }

  Future<void> _storeResponseToDatabase(GeneratedMessage? response) async {
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
    if (response is RoomEventResponse) {
      if (response.hasMessageEvent()) {
        await _database.storeRoomEventMessages([response.messageEvent]);
      }
      if (response.hasMessageEventReaction()) {
        //
      }
      if (response.hasSystemEvent()) {
        await _database.storeRoomEventSystems([response.systemEvent]);
      }
      if (response.hasRoomStateChanged()) {
        await _database.storeRoomDetails([response.roomStateChanged]);
      }
    }
    if (response is RoomStateChangedResponse) {
      await _database.storeRoomDetails([response.detail]);
    }
    if (response is SyncRoomsResponse) {
      await _database.storeRoomEventMessages(response.messageEvents);
      await _database.storeRoomEventSystems(response.systemEvents);
    }
  }

  Future<DownloadMediaResponse> _downloadMediaContent(
    String userId,
    String contentId,
  ) {
    return _mediaService.download(userId, contentId).then((value) {
      return DownloadMediaResponse(
        content: MediaContent(
          contentType: (value.response.headers[HttpHeaders.contentTypeHeader]!).first,
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
      final mediaIds = (tmpMediaIds is List) ? tmpMediaIds.cast<String>() : <String>[];
      return UploadMediaResponse(
        mediaIds: mediaIds,
      );
    });
  }
}
