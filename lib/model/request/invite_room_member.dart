import 'package:sputnikn_chat_client/generated/chat_message.pb.dart' as proto;
import 'package:sputnikn_chat_client/model/request/base_request.dart';

class InviteRoomMemberRequest extends BaseRequest<proto.InviteRoomMember> {
  const InviteRoomMemberRequest({
    required this.roomId,
    required this.memberIds,
  });

  final String roomId;
  final List<String> memberIds;

  @override
  proto.InviteRoomMember toProto() {
    return proto.InviteRoomMember(
      roomId: roomId,
      memberIds: memberIds,
    );
  }
}
