import 'package:protobuf/protobuf.dart';
import 'package:sputnikn_chat_client/model/request/base_request.dart';

class DownloadMediaRequest extends BaseRequest {
  const DownloadMediaRequest({
    required this.userId,
    required this.contentId,
  });

  final String userId;
  final String contentId;

  @override
  GeneratedMessage toProto() {
    throw UnimplementedError();
  }
}
