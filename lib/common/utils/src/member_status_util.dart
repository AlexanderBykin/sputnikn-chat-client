import 'package:sputnikn_chat_client/database/table/room_member.dart';
import 'package:sputnikn_chat_client/generated/contract.pbenum.dart';

abstract class MemberStatusUtil {
  static RoomMemberStatusType toProto(MemberStatus memberStatus) {
    return switch (memberStatus) {
      MemberStatus.memberStatusTypeInvited => RoomMemberStatusType.RoomMemberStatusTypeInvited,
      MemberStatus.memberStatusTypeJoined => RoomMemberStatusType.RoomMemberStatusTypeJoined,
      MemberStatus.memberStatusTypeLeft => RoomMemberStatusType.RoomMemberStatusTypeLeft,
      MemberStatus.memberStatusTypeKicked => RoomMemberStatusType.RoomMemberStatusTypeKicked,
      MemberStatus.memberStatusTypeBanned => RoomMemberStatusType.RoomMemberStatusTypeBanned,
    };
  }

  static MemberStatus fromProto(RoomMemberStatusType memberStatus) {
    return switch (memberStatus) {
      RoomMemberStatusType.RoomMemberStatusTypeInvited => MemberStatus.memberStatusTypeInvited,
      RoomMemberStatusType.RoomMemberStatusTypeJoined => MemberStatus.memberStatusTypeJoined,
      RoomMemberStatusType.RoomMemberStatusTypeLeft => MemberStatus.memberStatusTypeLeft,
      RoomMemberStatusType.RoomMemberStatusTypeKicked => MemberStatus.memberStatusTypeKicked,
      RoomMemberStatusType.RoomMemberStatusTypeBanned => MemberStatus.memberStatusTypeBanned,
      _ => MemberStatus.memberStatusTypeInvited,
    };
  }
}
