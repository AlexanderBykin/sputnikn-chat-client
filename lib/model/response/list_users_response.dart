import 'package:sputnikn_chat_client/sputnikn_chat_client.dart';
import 'package:sputnikn_chat_client/generated/chat_message.pb.dart' as Proto;
import 'package:sputnikn_chat_client/model/response/base_response.dart';

class ListUsersResponse extends BaseResponse {
  final List<UserDetail> users;

  ListUsersResponse({
    required this.users,
  });

  static ListUsersResponse fromProto(Proto.ListUsersReply proto) {
    return ListUsersResponse(
      users: proto.users.map((e) => UserDetail.fromProto(e)).toList(),
    );
  }
}
