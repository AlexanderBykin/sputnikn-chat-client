import 'package:sputnikn_chat_client/generated/chat_message.pb.dart' as Proto;
import 'package:sputnikn_chat_client/model/request/base_request.dart';

class CreateRoomRequest extends BaseRequest<Proto.CreateRoom> {
  final String title;
  final String? avatar;
  final List<String> memberIds;

  CreateRoomRequest({
    required this.title,
    required this.avatar,
    required this.memberIds,
  });

  @override
  Proto.CreateRoom toProto() {
    return Proto.CreateRoom(
      title: title,
      avatar: avatar,
      memberIds: memberIds,
    );
  }
}
