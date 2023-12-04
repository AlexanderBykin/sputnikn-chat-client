import 'package:sputnikn_chat_client/generated/chat_message.pb.dart' as proto;
import 'package:sputnikn_chat_client/model/request/base_request.dart';

class RemoveRoomMemberRequest extends BaseRequest<proto.RemoveRoomMember> {
  const RemoveRoomMemberRequest({
    required this.roomId,
    required this.memberIds,
  });

  final String roomId;
  final List<String> memberIds;

  @override
  proto.RemoveRoomMember toProto() {
    return proto.RemoveRoomMember(
      roomId: roomId,
      memberIds: memberIds,
    );
  }
}
