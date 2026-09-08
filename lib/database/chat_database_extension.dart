import 'package:sputnikn_chat_client/common/utils/src/member_status_util.dart';
import 'package:sputnikn_chat_client/database/chat_database.dart';
import 'package:sputnikn_chat_client/sputnikn_chat_client.dart';

extension ChatDatabaseExtension on ChatDatabase {
  Future<void> storeRoomDetails(List<RoomDetail> details) async {
    final roomsData = details
        .map(
          (e) => RoomData(
            id: e.roomId,
            title: e.title,
            avatar: e.avatar,
            dateCreate: DateTime.now(),
            dateUpdate: DateTime.now(),
          ),
        )
        .toList();
    await upsertRooms(roomsData);
    final usersData = details
        .expand(
          (room) => room.members.map((member) {
            return UserData(
              id: member.userId,
              fullName: member.fullName,
              avatar: member.avatar,
              dateCreate: DateTime.now(),
              dateUpdate: DateTime.now(),
            );
          }),
        )
        .toList();
    await upsertUsers(usersData);
    final roomMembersData = details
        .expand(
          (room) => room.members.map((member) {
            return RoomMemberData(
              userId: member.userId,
              roomId: room.roomId,
              permission: 0,
              memberStatus: MemberStatusUtil.fromProto(member.memberStatus),
              lastReadMarker: member.lastReadMarker.toDateTime(),
              dateCreate: DateTime.now(),
              dateUpdate: DateTime.now(),
            );
          }),
        )
        .toList();
    await upsertRoomMembers(roomMembersData);
  }

  Future<UserData> storeAuthUser(String login, String password, String accessToken, UserDetail detail) async {
    final userData = UserData(
      id: detail.userId,
      login: login,
      password: password,
      fullName: detail.fullName,
      avatar: detail.avatar,
      accessToken: accessToken,
      dateCreate: DateTime.now(),
      dateUpdate: DateTime.now(),
    );
    await upsertUser(userData);
    return userData;
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
    await upsertUsers(usersData);
  }

  Future<void> storeRoomEventMessages(
    List<RoomEventMessageDetail> details,
  ) async {
    final events = details.map((e) {
      return RoomEventMessageData(
        id: e.eventId,
        roomId: e.roomId,
        userId: e.senderId,
        content: e.content,
        version: e.version,
        dateCreate: e.createdAt.toDateTime(),
        dateEdit: e.updatedAt.toDateTime(),
      );
    }).toList();
    await upsertEventMessages(events);
  }

  Future<void> storeRoomEventSystems(
    List<RoomEventSystemDetail> details,
  ) async {
    final events = details.map((e) {
      return RoomEventSystemData(
        id: e.eventId,
        roomId: e.roomId,
        version: e.version,
        content: e.content,
        dateCreate: e.createdAt.toDateTime(),
      );
    }).toList();
    await upsertEventSystems(events);
  }
}
