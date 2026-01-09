import 'package:sputnikn_chat_client/sputnikn_chat_client.dart';

class UploadMediaRequest {
  const UploadMediaRequest({
    required this.userId,
    required this.files,
  });

  final String userId;
  final List<MediaContent> files;
}
