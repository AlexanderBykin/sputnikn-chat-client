import 'package:sputnikn_chat_client/generated/chat_message.pb.dart' as Proto;
import 'package:sputnikn_chat_client/model/request/base_request.dart';

class RemoveRoomMemberRequest extends BaseRequest<Proto.RemoveRoomMember> {
  final String roomId;
  final List<String> memberIds;

  RemoveRoomMemberRequest({
    required this.roomId,
    required this.memberIds,
  });

  @override
  Proto.RemoveRoomMember toProto() {
    return Proto.RemoveRoomMember(
      roomId: roomId,
      memberIds: memberIds,
    );
  }
}
