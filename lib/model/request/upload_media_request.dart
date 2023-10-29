import 'package:protobuf/protobuf.dart';
import 'package:sputnikn_chat_client/model/request/base_request.dart';
import 'package:sputnikn_chat_client/sputnikn_chat_client.dart';

class UploadMediaRequest extends BaseRequest {
  const UploadMediaRequest({
    required this.userId,
    required this.files,
  });

  final String userId;
  final List<MediaContent> files;

  @override
  GeneratedMessage toProto() {
    throw UnimplementedError();
  }
}
