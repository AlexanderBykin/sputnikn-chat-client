import 'package:sputnikn_chat_client/sputnikn_chat_client.dart';

class UploadMediaResponse extends BaseResponse {
  final List<String> mediaIds;

  UploadMediaResponse({
    required this.mediaIds,
  });
}
