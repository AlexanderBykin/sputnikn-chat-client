import 'package:sputnikn_chat_client/generated/chat_message.pb.dart' as Proto;
import './base_response.dart';
import './user_detail.dart';

class AuthUserResponse extends BaseResponse {
  final UserDetail detail;

  AuthUserResponse({
    required this.detail,
  });

  static AuthUserResponse fromProto(Proto.AuthUserReply proto) {
    return AuthUserResponse(
     detail: UserDetail.fromProto(proto.detail),
    );
  }
}
