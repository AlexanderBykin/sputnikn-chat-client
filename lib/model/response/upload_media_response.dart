import 'package:sputnikn_chat_client/sputnikn_chat_client.dart';

class UploadMediaResponse extends BaseResponse {
  const UploadMediaResponse({
    required this.mediaIds,
  });

  final List<String> mediaIds;
}
