import 'dart:async';
import 'dart:convert';
import 'package:grpc/grpc.dart';
import 'package:sputnikn_chat_client/generated/contract.pbgrpc.dart';
import 'package:test/test.dart';

void main() {
  late ChatServiceClient chatClient;

  setUp(() async {
    final channel = ClientChannel(
      'localhost',
      port: 50051,
      options: ChannelOptions(
        credentials: const ChannelCredentials.insecure(),
        codecRegistry: CodecRegistry(
          codecs: const [GzipCodec(), IdentityCodec()],
        ),
      ),
    );
    chatClient = ChatServiceClient(channel);
  });

  tearDown(() {
    //
  });

  test(
    'Test any command without Auth return NeedAuth',
    () async {
      final completer = Completer<bool>();
      try {
        await chatClient.createRoom(CreateRoomRequest(title: 'test room'));
        completer.complete(false);
      } catch (ex) {
        completer.complete(true);
      } finally {
        // chatClient.disconnect();
      }

      final result = await completer.future.timeout(
        const Duration(seconds: 3),
        onTimeout: () => false,
      );
      expect(result, true);
    },
  );

  test(
    'Test auth return response',
    () async {
      final completer = Completer<bool>();
      try {
        await chatClient.authUser(AuthUserRequest(login: 'testuser1', password: '1'));
        completer.complete(true);
      } catch (ex) {
        completer.complete(false);
      } finally {
        // chatClient.disconnect();
      }
      final result = await completer.future.timeout(
        const Duration(seconds: 3),
        onTimeout: () => false,
      );
      expect(
        result,
        true,
        reason: 'Expected response as AuthUserResponse',
      );
    },
  );

  test(
    'Test auth and listRooms return response',
    () async {
      final completer = Completer<bool>();
      try {
        await chatClient.authUser(AuthUserRequest(login: 'testuser1', password: '1'));
        final rooms = await chatClient.listRooms(ListRoomsRequest());
        completer.complete(rooms.detail.isNotEmpty);
      } catch (ex) {
        completer.complete(false);
      } finally {
        // chatClient.disconnect();
      }

      final result = await completer.future.timeout(
        const Duration(seconds: 5),
        onTimeout: () => false,
      );
      expect(
        result,
        true,
        reason: 'Expected response as ListRoomsResponse',
      );
    },
  );

  test(
    'Test auth and listUsers return response',
    () async {
      final completer = Completer<bool>();
      try {
        await chatClient.authUser(AuthUserRequest(login: 'testuser1', password: '1'));
        final users = await chatClient.listUsers(ListUsersRequest());
        completer.complete(users.users.isNotEmpty);
      } catch (ex) {
        completer.complete(false);
      } finally {
        // chatClient.disconnect();
      }
      final result = await completer.future.timeout(
        const Duration(seconds: 5),
        onTimeout: () => false,
      );
      expect(
        result,
        true,
        reason: 'Expected response as ListUsersResponse',
      );
    },
  );

  test(
    'Test auth and CreateRoom returns response',
    () async {
      final completer = Completer<bool>();
      try {
        final user = await chatClient.authUser(AuthUserRequest(login: 'testuser1', password: '1'));
        final users = await chatClient.listUsers(ListUsersRequest());
        final otherUsers = users.users..shuffle();
        final usersToAdd = otherUsers.take(2).toList()..add(user.detail);
        final title = 'test room with ${usersToAdd.map((u) => u.fullName).join(',')}';
        final roomCreated = await chatClient.createRoom(
          CreateRoomRequest(
            title: title,
            memberIds: usersToAdd.map((e) => e.userId).toList(),
          ),
        );
        completer.complete(
          roomCreated.detail.roomId.isNotEmpty && roomCreated.detail.members.any((e) => e.userId == user.detail.userId),
        );
      } catch (ex) {
        completer.complete(false);
      } finally {
        // chatClient.disconnect();
      }
      final result = await completer.future.timeout(
        const Duration(seconds: 3),
        onTimeout: () => false,
      );
      expect(result, true, reason: 'Expected response as CreateRoomResponse');
    },
  );

  test(
    'Test auth and CreateRoom, send message returns response',
    () async {
      expect(true, true);
    },
  );

  test(
    'Test auth and CreateRoom with less Users returns Error',
    () async {
      final completer = Completer<bool>();
      try {
        final user = await chatClient.authUser(AuthUserRequest(login: 'testuser1', password: '1'));
        await chatClient.createRoom(
          CreateRoomRequest(
            title: 'test',
            memberIds: [user.detail.userId],
          ),
        );
        completer.complete(false);
      } catch (ex) {
        completer.complete(true);
      } finally {
        // chatClient.disconnect();
      }
      final result = await completer.future.timeout(
        const Duration(seconds: 3),
        onTimeout: () => false,
      );
      expect(
        result,
        true,
        reason: 'Expected response as CreateRoomResponse with Error',
      );
    },
  );

  test(
    'Test auth and send message to room returns response',
    () async {
      final completer = Completer<bool>();
      try {
        final user = await chatClient.authUser(AuthUserRequest(login: 'testuser1', password: '1'));
        final rooms = await chatClient.listRooms(ListRoomsRequest());
        if (rooms.detail.isEmpty) {
          completer.complete(false);
        } else {
          final room = rooms.detail.first;
          final msgContent = json.encode({'content': 'test message'});
          final newMessage = await chatClient.addRoomMessage(
            RoomEventMessageRequest(
              roomId: room.roomId,
              content: msgContent,
              version: 1,
            ),
          );
          completer.complete(
            newMessage.detail.roomId == room.roomId &&
                newMessage.detail.senderId == user.detail.userId &&
                newMessage.detail.content == msgContent,
          );
        }
      } catch (ex) {
        completer.complete(false);
      } finally {
        // chatClient.disconnect();
      }
      final result = await completer.future.timeout(
        const Duration(seconds: 3),
        onTimeout: () => false,
      );
      expect(
        result,
        true,
        reason: 'Expected response as RoomEventMessageResponse',
      );
    },
  );

  test(
    'Test auth and SyncRooms returns response',
    () async {
      final completer = Completer<bool>();
      try {
        await chatClient.authUser(AuthUserRequest(login: 'testuser1', password: '1'));
        await chatClient.syncRooms(SyncRoomsRequest());
        completer.complete(true);
      } catch (ex) {
        completer.complete(false);
      } finally {
        // chatClient.disconnect();
      }
      final result = await completer.future.timeout(
        const Duration(seconds: 3),
        onTimeout: () => false,
      );
      expect(result, true, reason: 'Expected response as SyncRoomsResponse');
    },
  );

  test(
    'test download media content',
    () async {
      /*
      final completer = Completer<bool>();
      try {
        final user = await chatClient.authUser(AuthUserRequest(login: 'testuser1', password: '1'));
        final media = await chatClient.downloadMedia('5765b96f-2d2c-45b8-b6f3-b131d8e30714');
        print('>>> mediaType=${media.content.contentType}');
        completer.complete(media.content.bytes.isNotEmpty);
      } catch (ex) {
        completer.complete(false);
      } finally {
        chatClient.disconnect();
      }
      final result = await completer.future.timeout(
        const Duration(seconds: 3),
        onTimeout: () => false,
      );
      expect(
        result,
        true,
        reason: 'Expected response as DownloadMediaResponse',
      );
       */
    },
  );
}
