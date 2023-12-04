// ignore_for_file: no_default_cases

import 'package:sputnikn_chat_client/database/table/tables.dart';
import 'package:sputnikn_chat_client/generated/chat_message.pb.dart' as proto;

class RoomMemberDetail {
  const RoomMemberDetail({
    required this.userId,
    required this.fullName,
    required this.isOnline,
    required this.memberStatus,
    this.avatar,
    this.lastReadMarker,
  });

  final String userId;
  final String fullName;
  final bool isOnline;
  final String? avatar;
  final DateTime? lastReadMarker;
  final proto.RoomMemberStatusType memberStatus;

  static RoomMemberDetail fromProto(proto.RoomMemberDetail data) {
    return RoomMemberDetail(
      userId: data.userId,
      fullName: data.fullName,
      isOnline: data.isOnline,
      memberStatus: data.memberStatus,
      avatar: (data.hasAvatar()) ? data.avatar : null,
      lastReadMarker: (data.hasLastReadMarker())
          ? DateTime.fromMillisecondsSinceEpoch(data.lastReadMarker.toInt())
          : null,
    );
  }

  static MemberStatus protoMemberStatusToDB(
    proto.RoomMemberStatusType memberStatus,
  ) {
    switch (memberStatus) {
      case proto.RoomMemberStatusType.roomMemberStatusTypeInvited:
        return MemberStatus.memberStatusTypeInvited;
      case proto.RoomMemberStatusType.roomMemberStatusTypeJoined:
        return MemberStatus.memberStatusTypeJoined;
      case proto.RoomMemberStatusType.roomMemberStatusTypeLeft:
        return MemberStatus.memberStatusTypeLeft;
      case proto.RoomMemberStatusType.roomMemberStatusTypeKicked:
        return MemberStatus.memberStatusTypeKicked;
      case proto.RoomMemberStatusType.roomMemberStatusTypeBanned:
        return MemberStatus.memberStatusTypeBanned;
      default:
        return MemberStatus.memberStatusTypeInvited;
    }
  }

  static proto.RoomMemberStatusType dbMemberStatusToProto(
      MemberStatus memberStatus) {
    switch (memberStatus) {
      case MemberStatus.memberStatusTypeInvited:
        return proto.RoomMemberStatusType.roomMemberStatusTypeInvited;
      case MemberStatus.memberStatusTypeJoined:
        return proto.RoomMemberStatusType.roomMemberStatusTypeJoined;
      case MemberStatus.memberStatusTypeLeft:
        return proto.RoomMemberStatusType.roomMemberStatusTypeLeft;
      case MemberStatus.memberStatusTypeKicked:
        return proto.RoomMemberStatusType.roomMemberStatusTypeKicked;
      case MemberStatus.memberStatusTypeBanned:
        return proto.RoomMemberStatusType.roomMemberStatusTypeBanned;
      default:
        return proto.RoomMemberStatusType.roomMemberStatusTypeInvited;
    }
  }
}
