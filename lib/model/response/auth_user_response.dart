import 'package:sputnikn_chat_client/generated/chat_message.pb.dart' as proto;
import 'package:sputnikn_chat_client/model/response/base_response.dart';
import 'package:sputnikn_chat_client/model/response/user_detail.dart';

class AuthUserResponse extends BaseResponse {
  const AuthUserResponse({
    required this.detail,
  });

  final UserDetail detail;

  static AuthUserResponse fromProto(proto.AuthUserReply data) {
    return AuthUserResponse(
      detail: UserDetail.fromProto(data.detail),
    );
  }
}
