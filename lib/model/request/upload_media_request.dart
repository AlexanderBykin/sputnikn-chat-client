import 'package:sputnikn_chat_client/sputnikn_chat_client.dart';

class UploadMediaRequest {
  const UploadMediaRequest({
    required this.files,
  });

  final List<MediaContent> files;
}
