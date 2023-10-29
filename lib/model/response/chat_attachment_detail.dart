import 'package:sputnikn_chat_client/generated/chat_message.pb.dart' as proto;

class ChatAttachmentDetail {
  const ChatAttachmentDetail({
    required this.eventId,
    required this.attachmentId,
    required this.mimeType,
  });

  final String eventId;
  final String attachmentId;
  final String mimeType;

  static ChatAttachmentDetail fromProto(proto.ChatAttachmentDetail data) {
    return ChatAttachmentDetail(
      eventId: data.eventId,
      attachmentId: data.attachmentId,
      mimeType: data.mimeType,
    );
  }
}
