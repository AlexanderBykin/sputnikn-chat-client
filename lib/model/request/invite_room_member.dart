import 'package:sputnikn_chat_client/generated/chat_message.pb.dart' as Proto;
import 'package:sputnikn_chat_client/model/request/base_request.dart';

class InviteRoomMemberRequest extends BaseRequest<Proto.InviteRoomMember> {
  final String roomId;
  final List<String> memberIds;

  InviteRoomMemberRequest({
    required this.roomId,
    required this.memberIds,
  });

  @override
  Proto.InviteRoomMember toProto() {
    return Proto.InviteRoomMember(
      roomId: roomId,
      memberIds: memberIds,
    );
  }
}
