import 'package:sputnikn_chat_client/sputnikn_chat_client.dart';
import 'package:sputnikn_chat_client/database/table/room.dart';
import 'package:sputnikn_chat_client/database/table/room_event_message.dart';
import 'package:sputnikn_chat_client/database/table/room_event_message_attachment.dart';
import 'package:sputnikn_chat_client/database/table/room_event_message_reaction.dart';
import 'package:sputnikn_chat_client/database/table/room_event_system.dart';
import 'package:sputnikn_chat_client/database/table/room_member.dart';
import 'package:sputnikn_chat_client/database/table/user_push.dart';
import 'package:sputnikn_chat_client/database/table/users.dart';
import 'package:drift/backends.dart';
import 'package:drift/drift.dart';

part 'chat_database.g.dart';

@DriftDatabase(
  tables: [
    Room,
    RoomEventMessage,
    RoomEventMessageAttachment,
    RoomEventMessageReaction,
    RoomEventSystem,
    RoomMember,
    User,
    UserPush
  ],
  queries: {
    'lastGeneratedEventMessageId':
        'select max(client_event_id) from room_event_message where user_id=:userId;'
  },
)
class ChatDatabase extends _$ChatDatabase {
  ChatDatabase(DelegatedDatabase delegate) : super(delegate);

  @override
  int get schemaVersion => 1;

  //#region User Methods

  Future<List<RoomData>> getUserRooms(
    String userId,
    Set<String> roomIds,
  ) async {
    final query = select(room).join([
      innerJoin(roomMember, roomMember.roomId.equalsExp(room.id)),
      innerJoin(user, roomMember.userId.equalsExp(user.id))
    ])
      ..where(user.id.equals(userId) &
          (roomIds.isNotEmpty ? room.id.isIn(roomIds) : Variable(1).equals(1)));
    return query.get().then((value) {
      return value.map((e) => e.readTable<Room, RoomData>(room)).toList();
    });
  }

  Future<List<UserData>> getUsersByRooms(Set<String> roomIds) {
    final query = select(user, distinct: true).join([
      innerJoin(roomMember, roomMember.userId.equalsExp(user.id)),
      innerJoin(room, roomMember.roomId.equalsExp(room.id)),
    ])
      ..where(room.id.isIn(roomIds));
    return query.get().then((value) {
      return value.map((e) => e.readTable<User, UserData>(user)).toList();
    });
  }

  Future<List<RoomDetail>> getUserRoomsAsRoomDetail(
    String userId,
    Set<String> roomIds,
  ) async {
    final userRooms = await getUserRooms(userId, roomIds);
    final usersByRooms =
        await getUsersByRooms(userRooms.map((e) => e.id).toSet());
    final roomMembers =
        await getRoomMembersByRooms(userRooms.map((e) => e.id).toSet());

    return userRooms.map((room) {
      return RoomDetail(
        roomId: room.id,
        title: room.title,
        avatar: room.avatar,
        members: roomMembers
            .where((roomMember) => usersByRooms.any((user) {
                  return roomMember.roomId == room.id &&
                      roomMember.userId == user.id;
                }))
            .map((roomMember) {
          final user =
              usersByRooms.firstWhere((user) => user.id == roomMember.userId);
          return RoomMemberDetail(
            userId: user.id,
            fullName: user.fullName,
            isOnline: false,
            memberStatus:
                RoomMemberDetail.dbMemberStatusToProto(roomMember.memberStatus),
            avatar: user.avatar,
            lastReadMarker: roomMember.lastReadMarker,
          );
        }).toList(),
        eventMessageUnreadCount: 0,
        eventSystemUnreadCount: 0,
      );
    }).toList();
  }

  Future<int> upsertUser(UserData data) {
    return into(user).insertOnConflictUpdate(data);
  }

  Future<void> upsertUsers(List<UserData> data) {
    return batch((batch) {
      return batch.insertAllOnConflictUpdate(user, data);
    });
  }

  //#endregion

  //#region Room methods

  Future<int> upsertRoom(RoomData data) {
    return into(room).insertOnConflictUpdate(data);
  }

  Future<void> upsertRooms(List<RoomData> data) {
    return batch((batch) {
      return batch.insertAllOnConflictUpdate(room, data);
    });
  }

  Future<int> deleteRoom(RoomData data) {
    return (delete(room)..where((t) => t.id.equals(data.id))).go();
  }

  //#endregion

  //#region RoomMember Methods

  Future<List<RoomMemberData>> getRoomMembersByRooms(Set<String> roomIds) {
    final query = select(roomMember).join([
      innerJoin(room, roomMember.roomId.equalsExp(room.id)),
    ])
      ..where(room.id.isIn(roomIds));
    return query.get().then((value) {
      return value
          .map((e) => e.readTable<RoomMember, RoomMemberData>(roomMember))
          .toList();
    });
  }

  Future<int> upsertRoomMember(RoomMemberData data) {
    return into(roomMember).insertOnConflictUpdate(data);
  }

  Future<void> upsertRoomMembers(List<RoomMemberData> data) {
    return batch((batch) {
      return batch.insertAllOnConflictUpdate(roomMember, data);
    });
  }

  Future<int> deleteRoomMember(RoomMemberData data) {
    return (delete(roomMember)
          ..where((t) =>
              t.roomId.equals(data.roomId) & t.userId.equals(data.userId)))
        .go();
  }

  //#endregion

  //#region RoomEventMessage Methods

  Future<int> upsertEventMessage(RoomEventMessageData data) {
    return into(roomEventMessage).insertOnConflictUpdate(data);
  }

  Future<void> upsertEventMessages(List<RoomEventMessageData> data) {
    return batch((batch) {
      return batch.insertAllOnConflictUpdate(roomEventMessage, data);
    });
  }

  Future<int> deleteEventMessage(RoomEventMessageData data) {
    return (delete(roomEventMessage)..where((t) => t.id.equals(data.id))).go();
  }

  Future<int> getNextGeneratedEventMessageId(String userId) {
    return lastGeneratedEventMessageId(userId)
        .getSingleOrNull()
        .then((value) => (value ?? 0) + 1);
  }

  //#endregion

  //#region RoomEventSystem

  Future<void> upsertEventSystems(List<RoomEventSystemData> data) {
    return batch((batch) {
      return batch.insertAllOnConflictUpdate(roomEventSystem, data);
    });
  }

  //#endregion
}
