import 'package:sputnikn_chat_client/generated/chat_message.pb.dart' as proto;
import 'package:sputnikn_chat_client/model/request/base_request.dart';

class CreateRoomRequest extends BaseRequest<proto.CreateRoom> {
  const CreateRoomRequest({
    required this.title,
    required this.avatar,
    required this.memberIds,
  });

  final String title;
  final String? avatar;
  final List<String> memberIds;

  @override
  proto.CreateRoom toProto() {
    return proto.CreateRoom(
      title: title,
      avatar: avatar,
      memberIds: memberIds,
    );
  }
}
