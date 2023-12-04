import 'package:sputnikn_chat_client/generated/chat_message.pb.dart' as proto;
import 'package:sputnikn_chat_client/model/request/base_request.dart';

class AuthUserRequest extends BaseRequest<proto.AuthUser> {
  const AuthUserRequest({
    required this.login,
    required this.password,
  });

  final String login;
  final String password;

  @override
  proto.AuthUser toProto() {
    return proto.AuthUser(
      login: login,
      password: password,
    );
  }
}
