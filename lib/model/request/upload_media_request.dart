import 'package:sputnikn_chat_client/sputnikn_chat_client.dart';
import 'package:sputnikn_chat_client/model/request/base_request.dart';
import 'package:protobuf/protobuf.dart';

class UploadMediaRequest extends BaseRequest {
  final String userId;
  final List<MediaContent> files;

  UploadMediaRequest({
    required this.userId,
    required this.files,
  });

  @override
  GeneratedMessage toProto() {
    throw UnimplementedError();
  }
}
