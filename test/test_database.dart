import 'package:drift/native.dart';
import 'package:sputnikn_chat_client/database/chat_database.dart';
import 'package:sputnikn_chat_client/database/table/tables.dart';
import 'package:test/test.dart';

void main() {
  ChatDatabase? db;

  setUp(() {
    db = ChatDatabase(NativeDatabase.memory());
  });

  tearDown(() {
    db?.close();
  });

  test('check getUserRoomsAsRoomDetail return correct result', () async {
    final user1 = UserData(
      id: 'user1',
      fullName: 'user1',
      dateCreate: DateTime.now(),
    );
    final user2 = UserData(
      id: 'user2',
      fullName: 'user2',
      dateCreate: DateTime.now(),
    );
    final user3 = UserData(
      id: 'user3',
      fullName: 'user3',
      dateCreate: DateTime.now(),
    );
    final room1 = RoomData(
      id: 'room1',
      title: 'room1',
      dateCreate: DateTime.now(),
    );
    final room2 = RoomData(
      id: 'room2',
      title: 'room2',
      dateCreate: DateTime.now(),
    );
    final roomMembers = [
      RoomMemberData(
        roomId: room1.id,
        userId: user1.id,
        memberStatus: MemberStatus.memberStatusTypeInvited,
        permission: 0,
        dateCreate: DateTime.now(),
      ),
      RoomMemberData(
        roomId: room1.id,
        userId: user2.id,
        memberStatus: MemberStatus.memberStatusTypeInvited,
        permission: 0,
        dateCreate: DateTime.now(),
      ),
      RoomMemberData(
        roomId: room2.id,
        userId: user1.id,
        memberStatus: MemberStatus.memberStatusTypeInvited,
        permission: 0,
        dateCreate: DateTime.now(),
      ),
      RoomMemberData(
        roomId: room2.id,
        userId: user3.id,
        memberStatus: MemberStatus.memberStatusTypeInvited,
        permission: 0,
        dateCreate: DateTime.now(),
      ),
    ];
    await db?.upsertUser(user1);
    await db?.upsertUser(user2);
    await db?.upsertUser(user3);
    await db?.upsertRoom(room1);
    await db?.upsertRoom(room2);
    await Future.wait(roomMembers.map((e) => db!.upsertRoomMember(e)));
    final result1 = await db!.getUserRoomsAsRoomDetail(user1.id, {});
    final result2 = await db!.getUserRoomsAsRoomDetail(user2.id, {});
    final result3 = await db!.getUserRoomsAsRoomDetail(user3.id, {});
    expect(result1.length, 2);
    expect(result2.length, 1);
    expect(result3.length, 1);
    expect(result1[0].roomId, room1.id);
    expect(
      result1[0].members.length,
      roomMembers.where((e) => e.roomId == room1.id).toList().length,
    );
    expect(result1[1].roomId, room2.id);
    expect(
      result1[1].members.length,
      roomMembers.where((e) => e.roomId == room2.id).toList().length,
    );
  });
}
