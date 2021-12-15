import 'package:sputnikn_chat_client/sputnikn_chat_client.dart';
import 'package:sputnikn_chat_client/database/chat_database.dart';
import 'package:sputnikn_chat_client/model/response/room_event_system_detail.dart';

extension ChatDatabaseExtension on ChatDatabase {
  Future<void> storeRoomDetails(List<RoomDetail> details) async {
    final roomsData = details
        .map((e) => RoomData(
              id: e.roomId,
              title: e.title,
              avatar: e.avatar,
              dateCreate: DateTime.now(),
              dateUpdate: DateTime.now(),
            ))
        .toList();
    await this.upsertRooms(roomsData);
    final usersData = details
        .expand((room) => room.members.map((member) {
              return UserData(
                id: member.userId,
                fullName: member.fullName,
                avatar: member.avatar,
                dateCreate: DateTime.now(),
                dateUpdate: DateTime.now(),
              );
            }))
        .toList();
    await this.upsertUsers(usersData);
    final roomMembersData = details
        .expand((room) => room.members.map((member) {
              return RoomMemberData(
                userId: member.userId,
                roomId: room.roomId,
                permission: 0,
                memberStatus:
                    RoomMemberDetail.protoMemberStatusToDB(member.memberStatus),
                lastReadMarker: member.lastReadMarker,
                dateCreate: DateTime.now(),
                dateUpdate: DateTime.now(),
              );
            }))
        .toList();
    await this.upsertRoomMembers(roomMembersData);
  }

  Future<void> storeUsers(List<UserDetail> details) async {
    final usersData = details.map((user) {
      return UserData(
        id: user.userId,
        fullName: user.fullName,
        avatar: user.avatar,
        dateCreate: DateTime.now(),
        dateUpdate: DateTime.now(),
      );
    }).toList();
    await this.upsertUsers(usersData);
  }

  Future<void> storeRoomEventMessages(
      List<RoomEventMessageDetail> details) async {
    final events = details.map((e) {
      return RoomEventMessageData(
        id: e.eventId,
        roomId: e.roomId,
        userId: e.senderId,
        content: e.content,
        version: e.version,
        clientEventId: e.clientEventId,
        dateCreate: e.createTimestamp,
        dateEdit: e.updateTimestamp,
      );
    }).toList();
    await this.upsertEventMessages(events);
  }

  Future<void> storeRoomEventSystems(
      List<RoomEventSystemDetail> details) async {
    final events = details.map((e) {
      return RoomEventSystemData(
        id: e.eventId,
        roomId: e.roomId,
        version: e.version,
        content: e.content,
        dateCreate: e.createTimestamp,
      );
    }).toList();
    await this.upsertEventSystems(events);
  }
}
