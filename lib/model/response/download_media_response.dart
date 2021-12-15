import 'package:sputnikn_chat_client/sputnikn_chat_client.dart';

class DownloadMediaResponse extends BaseResponse {
  final MediaContent content;

  DownloadMediaResponse({
    required this.content,
  });
}
