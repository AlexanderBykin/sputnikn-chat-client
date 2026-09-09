import 'dart:async';
import 'dart:io';
import 'dart:isolate';

import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
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
  const IsolatedChatClientArgs({
    required this.remoteSendPort,
    required this.databasePath,
    required this.chatServerHost,
    required this.chatServerPort,
    required this.mediaServer,
    required this.httpProxy,
  });

  final SendPort remoteSendPort;
  final String databasePath;
  final String chatServerHost;
  final int chatServerPort;
  final String mediaServer;
  final String httpProxy;
}

class IsolatedChatClient {
  IsolatedChatClient._(
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
    _chatService = ChatServiceClient(channel);
  }

  final SendPort remoteSendPort;
  final String chatServerHost;
  final int chatServerPort;
  final String mediaServer;
  final String httpProxy;
  final _uuid = const Uuid();
  late ChatDatabase _database;
  late ApiClient _mediaService;
  late ChatServiceClient _chatService;
  final _defaultMimeType = 'application/octet-stream';
  UserData? _userSession;

  static void create(IsolatedChatClientArgs args) {
    final receivePort = ReceivePort();
    late StreamSubscription<dynamic> receiveSubs;
    final client = IsolatedChatClient._(
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
        if (message == 'stop') {
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
      if (_userSession == null) {
        _sendNotAuthorizedUser(request.queueId);
      } else {
        final uploadRequest = request.data as UploadMediaRequest;
        final result = await _uploadMediaContent(
          _userSession!.id,
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
    }
    if (request.data is DownloadMediaRequest) {
      if (_userSession == null) {
        _sendNotAuthorizedUser(request.queueId);
      } else {
        final downloadRequest = request.data as DownloadMediaRequest;
        final result = await _downloadMediaContent(
          _userSession!.id,
          downloadRequest.contentId,
        );
        remoteSendPort.send(QueueResponse.success(request.queueId, result));
      }
    }
  }

  Future<void> processRequest(QueueRequest request) async {
    await _storeRequestToDatabase(request.data);
    GeneratedMessage? response;
    if (request.data is AuthUserRequest) {
      final requestData = request.data as AuthUserRequest;
      if (request.isOffline) {
        // find user at local database and set session
      } else {
        response = await _chatService.authUser(requestData);
        if (response is AuthUserResponse) {
          if (response.error == AuthErrorType.AuthErrorTypeNone && response.hasAccessToken() && response.hasDetail()) {
            _userSession = await _database.storeAuthUser(
              requestData.login,
              requestData.password,
              response.accessToken,
              response.detail,
            );
          }
        }
      }
    } else if (request.data is ListUsersRequest) {
      if (_userSession == null) {
        _sendNotAuthorizedUser(request.queueId);
      } else {
        final data = request.data as ListUsersRequest;
        if (request.isOffline) {
          //
        } else {
          response = await _chatService.listUsers(
            data,
            options: _buildCallOptions(),
          );
        }
      }
    } else if (request.data is ListRoomsRequest) {
      if (_userSession == null) {
        _sendNotAuthorizedUser(request.queueId);
      } else {
        final data = request.data as ListRoomsRequest;
        response = await _doListRooms(request.isOffline, data.roomIds.toList());
        if (request.isOffline) {
          remoteSendPort.send(QueueResponse.success(request.queueId, response));
        }
      }
    } else if (request.data is SyncRoomsRequest) {
      if (_userSession == null) {
        _sendNotAuthorizedUser(request.queueId);
      } else {
        final data = request.data as SyncRoomsRequest;
        response = await _doSyncRooms(request.isOffline, data.roomFilter);
      }
    } else if (request.data is SmartSyncRoomsRequest) {
      if (_userSession == null) {
        _sendNotAuthorizedUser(request.queueId);
      } else {
        final rooms = await _doListRooms(request.isOffline, []);
        if (!request.isOffline) {
          await _storeResponseToDatabase(rooms);
        }
        final syncFilter = rooms.detail.map((room) {
          final member = room.members.toList().firstWhereOrNull(
            (member) => member.userId == _userSession?.id,
          );
          final sinceFilter = (member?.lastReadMarker != null)
              ? SinceTimeFilter(
                  since: member!.lastReadMarker,
                  orderType: SinceTimeOrderType.sinceTimeOrderTypeNewest,
                )
              : null;
          return SyncRoomFilter(
            roomId: room.roomId,
            sinceFilter: sinceFilter,
            eventFilter: RoomEventType.roomEventTypeAll,
            eventLimit: 500,
          );
        }).toList();
        response = await _doSyncRooms(request.isOffline, syncFilter);
        if (!request.isOffline) {
          await _storeResponseToDatabase(response);
        }
      }
    } else if (request.data is RoomReadMarkerRequest) {
      if (_userSession == null) {
        _sendNotAuthorizedUser(request.queueId);
      } else {
        final data = request.data as RoomReadMarkerRequest;
        if (request.isOffline) {
          //
        } else {
          response = await _chatService.setRoomReadMarker(
            data,
            options: _buildCallOptions(),
          );
        }
      }
    } else if (request.data is CreateRoomRequest) {
      if (_userSession == null) {
        _sendNotAuthorizedUser(request.queueId);
      } else {
        final data = request.data as CreateRoomRequest;
        if (request.isOffline) {
          //
        } else {
          response = await _chatService.createRoom(
            data,
            options: _buildCallOptions(),
          );
        }
      }
    } else if (request.data is InviteRoomMemberRequest) {
      if (_userSession == null) {
        _sendNotAuthorizedUser(request.queueId);
      } else {
        final data = request.data as InviteRoomMemberRequest;
        if (request.isOffline) {
          //
        } else {
          response = await _chatService.inviteRoomMember(
            data,
            options: _buildCallOptions(),
          );
        }
      }
    } else if (request.data is RemoveRoomMemberRequest) {
      if (_userSession == null) {
        _sendNotAuthorizedUser(request.queueId);
      } else {
        final data = request.data as RemoveRoomMemberRequest;
        if (request.isOffline) {
          //
        } else {
          response = await _chatService.removeRoomMember(
            data,
            options: _buildCallOptions(),
          );
        }
      }
    } else if (request.data is RoomEventMessageRequest) {
      if (_userSession == null) {
        _sendNotAuthorizedUser(request.queueId);
      } else {
        final data = request.data as RoomEventMessageRequest;
        if (request.isOffline) {
          final dateCreation = DateTime.now();
          await _database.upsertEventMessage(
            RoomEventMessageData(
              id: _uuid.v4(),
              roomId: data.roomId,
              userId: _userSession!.id,
              content: data.content,
              version: data.version,
              dateCreate: dateCreation,
              dateEdit: dateCreation,
            ),
          );
          // TODO(alexb): what should we do with attachments?
          remoteSendPort.send(
            QueueResponse.success(
              request.queueId,
              RoomEventMessageResponse(
                detail: RoomEventMessageDetail(
                  eventId: _uuid.v4(),
                  roomId: data.roomId,
                  senderId: _userSession!.id,
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
          response = await _chatService.addRoomMessage(
            data,
            options: _buildCallOptions(),
          );
        }
      }
    } else if (request.data is RoomEventMessageReactionRequest) {
      if (_userSession == null) {
        _sendNotAuthorizedUser(request.queueId);
      } else {
        final data = request.data as RoomEventMessageReactionRequest;
        if (request.isOffline) {
          //
        } else {
          response = await _chatService.addRoomMessageReaction(
            data,
            options: _buildCallOptions(),
          );
        }
      }
    } else {
      remoteSendPort.send(
        QueueResponse.failure(
          request.queueId,
          ChatError(
            'Unhandled message "${request.data.runtimeType}"',
            StackTrace.current.toString(),
          ),
        ),
      );
    }
    if (response != null) {
      await _storeResponseToDatabase(response);
      remoteSendPort.send(QueueResponse.success(request.queueId, response));
    }
  }

  Future<void> close() async {
    // TODO(alexb): how to disconnect client?
    await _database.close();
  }

  Future<ListRoomsResponse> _doListRooms(bool isOffline, List<String> roomIds) async {
    if (isOffline) {
      final rooms = await _database.getUserRoomsAsRoomDetail(_userSession!.id, roomIds.toSet());
      return ListRoomsResponse(detail: rooms);
    } else {
      return _chatService.listRooms(
        ListRoomsRequest(roomIds: roomIds),
        options: _buildCallOptions(),
      );
    }
  }

  Future<SyncRoomsResponse> _doSyncRooms(bool isOffline, List<SyncRoomFilter> roomFilter) {
    if (isOffline) {
      return Future.value(SyncRoomsResponse.create());
    } else {
      return _chatService.syncRooms(
        SyncRoomsRequest(roomFilter: roomFilter),
        options: _buildCallOptions(),
      );
    }
  }

  void _sendNotAuthorizedUser(int queueId) {
    remoteSendPort.send(
      QueueResponse.failure(
        queueId,
        ChatError('User not authorized.', StackTrace.current.toString()),
      ),
    );
  }

  CallOptions? _buildCallOptions() {
    if (_userSession == null || true == _userSession?.accessToken?.isEmpty) {
      return null;
    }
    return CallOptions(
      metadata: {'authorization': 'Bearer ${_userSession!.accessToken}'},
    );
  }

  Future<Object> _storeRequestToDatabase(Object request) async {
    if (request is RoomEventMessageRequest) {
      if (_userSession == null) throw Exception('User not authorized.');
      await _database.upsertEventMessage(
        RoomEventMessageData(
          id: _uuid.v4(),
          userId: _userSession!.id,
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
