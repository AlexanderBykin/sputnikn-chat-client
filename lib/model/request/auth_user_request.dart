import './base_request.dart';
import '../../generated/chat_message.pb.dart';

class AuthUserRequest extends BaseRequest<AuthUser> {
  final String login;
  final String password;

  AuthUserRequest({
    required this.login,
    required this.password,
  });

  @override
  AuthUser toProto() {
    return AuthUser(
      login: login,
      password: password,
    );
  }
}
