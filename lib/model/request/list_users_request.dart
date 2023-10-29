import 'package:sputnikn_chat_client/generated/chat_message.pb.dart' as proto;
import 'package:sputnikn_chat_client/model/request/base_request.dart';

class ListUsersRequest extends BaseRequest<proto.ListUsers> {
  @override
  proto.ListUsers toProto() {
    return proto.ListUsers();
  }
}
