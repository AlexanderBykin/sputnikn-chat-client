import 'package:sputnikn_chat_client/generated/chat_message.pb.dart';
import './base_request.dart';

class ListUsersRequest extends BaseRequest<ListUsers> {
  @override
  ListUsers toProto() {
    return ListUsers();
  }
}
