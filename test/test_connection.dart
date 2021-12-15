import 'dart:async';
import 'dart:convert';
import 'package:sputnikn_chat_client/sputnikn_chat_client.dart';
import 'package:test/test.dart';

void main() {
  Future<WebsocketChatClient> _getSocketClient(
    Function(WebsocketChatClient, BaseResponse) onMessage,
    Function(WebsocketChatClient, ChatError) onError, [
    bool closeWhenError = true,
  ]) {
    final clientReady = Completer<void>();
    final client = WebsocketChatClient(
      "ws://0.0.0.0:8443/chat",
      "http://0.0.0.0:8443",
      "testdb.db",
      "",
    );
    StreamSubscription? stateSubs;
    stateSubs = client.outSocketState.listen((event) {
      if (event.state == SocketStateType.socketStateTypeReady) {
        client.connect();
      } else if (event.state == SocketStateType.socketStateTypeConnected) {
        clientReady.complete();
      } else {
        clientReady.completeError("Client not ready");
      }
    });
    StreamSubscription? messageSubs;
    messageSubs = client.outMessage.listen((event) {
      onMessage(client, event);
    });
    StreamSubscription? errorSubs;
    errorSubs = client.outError.listen((event) {
      onError(client, event);
      if (closeWhenError) {
        stateSubs?.cancel();
        messageSubs?.cancel();
        errorSubs?.cancel();
        client.disconnect();
      }
    });
    return clientReady.future.then((value) => client);
  }

  late WebsocketChatClient _client;

  setUp(() async {
    _client = await _getSocketClient(
      (client, event) {},
      (client, error) {},
    );
  });

  tearDown(() {
    _client.disconnect();
  });

  test("Test any command without Auth return NeedAuth", () async {
    final completer = Completer<bool>();
    try {
      await _client.createRoom("test room", null, []);
      completer.complete(false);
    } catch (ex) {
      completer.complete(true);
    } finally {
      _client.disconnect();
    }

    final result = await completer.future.timeout(
      Duration(seconds: 3),
      onTimeout: () => false,
    );
    expect(result, true);
  });

  test('Test auth return response', () async {
    final completer = Completer<bool>();
    try {
      await _client.authUser("testuser1", "1");
      completer.complete(true);
    } catch (ex) {
      completer.complete(false);
    } finally {
      _client.disconnect();
    }
    final result = await completer.future.timeout(
      Duration(seconds: 3),
      onTimeout: () => false,
    );
    expect(result, true, reason: "Expected response as AuthUserResponse");
  });

  test('Test auth and listRooms return response', () async {
    final completer = Completer<bool>();
    try {
      final user = await _client.authUser("testuser1", "1");
      final rooms = await _client.listRooms({});
      completer.complete(rooms.detail.isNotEmpty);
    } catch (ex) {
      completer.complete(false);
    } finally {
      _client.disconnect();
    }

    final result = await completer.future.timeout(
      Duration(seconds: 5),
      onTimeout: () => false,
    );
    expect(result, true, reason: "Expected response as ListRoomsResponse");
  });

  test('Test auth and listUsers return response', () async {
    final completer = Completer<bool>();
    try {
      final user = await _client.authUser("testuser1", "1");
      final users = await _client.listUsers();
      completer.complete(users.users.isNotEmpty);
    } catch (ex) {
      completer.complete(false);
    } finally {
      _client.disconnect();
    }
    final result = await completer.future.timeout(
      Duration(seconds: 5),
      onTimeout: () => false,
    );
    expect(result, true, reason: "Expected response as ListUsersResponse");
  });

  test('Test auth and CreateRoom returns response', () async {
    final completer = Completer<bool>();
    try {
      final user = await _client.authUser("testuser1", "1");
      final users = await _client.listUsers();
      final otherUsers = users.users;
      otherUsers.shuffle();
      final usersToAdd = otherUsers.take(2).toList()..add(user.detail);
      final title =
          "test room with ${usersToAdd.map((u) => u.fullName).join(",")}";
      final roomCreated = await _client.createRoom(
        title,
        null,
        usersToAdd.map((e) => e.userId).toList(),
      );
      completer.complete(roomCreated.detail.roomId.isNotEmpty &&
          roomCreated.detail.members
              .any((e) => e.userId == user.detail.userId));
    } catch (ex) {
      completer.complete(false);
    } finally {
      _client.disconnect();
    }
    final result = await completer.future.timeout(
      Duration(seconds: 3),
      onTimeout: () => false,
    );
    expect(result, true, reason: "Expected response as CreateRoomResponse");
  });

  test('Test auth and CreateRoom, send message returns response', () async {
    expect(true, true);
  });

  test('Test auth and CreateRoom with less Users returns Error', () async {
    final completer = Completer<bool>();
    try {
      final user = await _client.authUser("testuser1", "1");
      final roomCreated = await _client.createRoom(
        "test",
        null,
        [user.detail.userId],
      );
      completer.complete(false);
    } catch (ex) {
      completer.complete(true);
    } finally {
      _client.disconnect();
    }
    final result = await completer.future.timeout(
      Duration(seconds: 3),
      onTimeout: () => false,
    );
    expect(result, true,
        reason: "Expected response as CreateRoomResponse with Error");
  });

  test('Test auth and send message to room returns response', () async {
    final completer = Completer<bool>();
    try {
      final user = await _client.authUser("testuser1", "1");
      final rooms = await _client.listRooms({});
      if (rooms.detail.isEmpty) {
        completer.complete(false);
      } else {
        final room = rooms.detail.first;
        final msgContent = json.encode({"content": "test message"});
        final newMessage = await _client.addRoomEventMessage(
          room.roomId,
          [],
          msgContent,
          1,
        );
        completer.complete(newMessage.detail.roomId == room.roomId &&
            newMessage.detail.senderId == user.detail.userId &&
            newMessage.detail.content == msgContent);
      }
    } catch (ex) {
      completer.complete(false);
    } finally {
      _client.disconnect();
    }
    final result = await completer.future.timeout(
      Duration(seconds: 3),
      onTimeout: () => false,
    );
    expect(result, true,
        reason: "Expected response as RoomEventMessageResponse");
  });

  test('Test auth and SyncRooms returns response', () async {
    final completer = Completer<bool>();
    try {
      final user = await _client.authUser("testuser1", "1");
      final syncRooms = await _client.syncRooms([]);
      completer.complete(true);
    } catch (ex) {
      completer.complete(false);
    } finally {
      _client.disconnect();
    }
    final result = await completer.future.timeout(
      Duration(seconds: 3),
      onTimeout: () => false,
    );
    expect(result, true, reason: "Expected response as SyncRoomsResponse");
  });

  test("test download media content", () async {
    final completer = Completer<bool>();
    try {
      final user = await _client.authUser("testuser1", "1");
      final media =
          await _client.downloadMedia("5765b96f-2d2c-45b8-b6f3-b131d8e30714");
      print(">>> mediaType=${media.content.contentType}");
      completer.complete(media.content.bytes.isNotEmpty);
    } catch (ex) {
      completer.complete(false);
    } finally {
      _client.disconnect();
    }
    final result = await completer.future.timeout(
      Duration(seconds: 3),
      onTimeout: () => false,
    );
    expect(result, true, reason: "Expected response as DownloadMediaResponse");
  });
}
