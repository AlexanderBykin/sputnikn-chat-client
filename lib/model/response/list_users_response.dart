import 'package:sputnikn_chat_client/generated/chat_message.pb.dart' as proto;
import 'package:sputnikn_chat_client/sputnikn_chat_client.dart';

class ListUsersResponse extends BaseResponse {
  const ListUsersResponse({
    required this.users,
  });

  final List<UserDetail> users;

  static ListUsersResponse fromProto(proto.ListUsersReply data) {
    return ListUsersResponse(
      users: data.users.map(UserDetail.fromProto).toList(),
    );
  }
}
