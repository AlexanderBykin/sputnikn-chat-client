import 'package:sputnikn_chat_client/model/request/base_request.dart';
import 'package:protobuf/protobuf.dart';

class DownloadMediaRequest extends BaseRequest {
  final String userId;
  final String contentId;

  DownloadMediaRequest({
    required this.userId,
    required this.contentId,
  });

  @override
  GeneratedMessage toProto() {
    throw UnimplementedError();
  }
}
