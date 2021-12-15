import 'package:sputnikn_chat_client/database/table/room_member.dart';
import 'package:sputnikn_chat_client/generated/chat_message.pb.dart' as Proto;

class RoomMemberDetail {
  final String userId;
  final String fullName;
  final bool isOnline;
  final String? avatar;
  final DateTime? lastReadMarker;
  final Proto.RoomMemberStatusType memberStatus;

  RoomMemberDetail({
    required this.userId,
    required this.fullName,
    required this.isOnline,
    required this.memberStatus,
    this.avatar,
    this.lastReadMarker,
  });

  static RoomMemberDetail fromProto(Proto.RoomMemberDetail proto) {
    return RoomMemberDetail(
      userId: proto.userId,
      fullName: proto.fullName,
      isOnline: proto.isOnline,
      memberStatus: proto.memberStatus,
      avatar: (proto.hasAvatar()) ? proto.avatar : null,
      lastReadMarker: (proto.hasLastReadMarker())
          ? DateTime.fromMillisecondsSinceEpoch(proto.lastReadMarker.toInt())
          : null,
    );
  }

  static MemberStatus protoMemberStatusToDB(
      Proto.RoomMemberStatusType memberStatus) {
    switch (memberStatus) {
      case Proto.RoomMemberStatusType.roomMemberStatusTypeInvited:
        return MemberStatus.memberStatusTypeInvited;
      case Proto.RoomMemberStatusType.roomMemberStatusTypeJoined:
        return MemberStatus.memberStatusTypeJoined;
      case Proto.RoomMemberStatusType.roomMemberStatusTypeLeft:
        return MemberStatus.memberStatusTypeLeft;
      case Proto.RoomMemberStatusType.roomMemberStatusTypeKicked:
        return MemberStatus.memberStatusTypeKicked;
      case Proto.RoomMemberStatusType.roomMemberStatusTypeBanned:
        return MemberStatus.memberStatusTypeBanned;
      default:
        return MemberStatus.memberStatusTypeInvited;
    }
  }

  static Proto.RoomMemberStatusType dbMemberStatusToProto(
      MemberStatus memberStatus) {
    switch (memberStatus) {
      case MemberStatus.memberStatusTypeInvited:
        return Proto.RoomMemberStatusType.roomMemberStatusTypeInvited;
      case MemberStatus.memberStatusTypeJoined:
        return Proto.RoomMemberStatusType.roomMemberStatusTypeJoined;
      case MemberStatus.memberStatusTypeLeft:
        return Proto.RoomMemberStatusType.roomMemberStatusTypeLeft;
      case MemberStatus.memberStatusTypeKicked:
        return Proto.RoomMemberStatusType.roomMemberStatusTypeKicked;
      case MemberStatus.memberStatusTypeBanned:
        return Proto.RoomMemberStatusType.roomMemberStatusTypeBanned;
      default:
        return Proto.RoomMemberStatusType.roomMemberStatusTypeInvited;
    }
  }
}
