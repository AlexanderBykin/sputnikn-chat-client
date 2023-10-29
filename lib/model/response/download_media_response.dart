import 'package:sputnikn_chat_client/sputnikn_chat_client.dart';

class DownloadMediaResponse extends BaseResponse {
  const DownloadMediaResponse({
    required this.content,
  });

  final MediaContent content;
}
