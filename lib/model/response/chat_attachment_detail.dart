import 'package:sputnikn_chat_client/generated/chat_message.pb.dart' as Proto;

class ChatAttachmentDetail {
  final String eventId;
  final String attachmentId;
  final String mimeType;

  ChatAttachmentDetail({
    required this.eventId,
    required this.attachmentId,
    required this.mimeType,
  });

  static ChatAttachmentDetail fromProto(Proto.ChatAttachmentDetail proto) {
    return ChatAttachmentDetail(
      eventId: proto.eventId,
      attachmentId: proto.attachmentId,
      mimeType: proto.mimeType,
    );
  }
}
