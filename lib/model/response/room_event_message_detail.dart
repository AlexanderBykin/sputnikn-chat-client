import 'package:sputnikn_chat_client/sputnikn_chat_client.dart';
import 'package:sputnikn_chat_client/generated/chat_message.pb.dart' as Proto;
import 'chat_attachment_detail.dart';

class RoomEventMessageDetail {
  final String eventId;
  final String roomId;
  final String senderId;
  final int? clientEventId;
  final int version;
  final List<ChatAttachmentDetail> attachment;
  final List<RoomEventReactionDetail> reaction;
  final String content;
  final DateTime createTimestamp;
  final DateTime updateTimestamp;

  RoomEventMessageDetail({
    required this.eventId,
    required this.roomId,
    required this.senderId,
    required this.clientEventId,
    required this.version,
    required this.attachment,
    required this.reaction,
    required this.content,
    required this.createTimestamp,
    required this.updateTimestamp,
  });

  static RoomEventMessageDetail fromProto(Proto.RoomEventMessageDetail proto) {
    return RoomEventMessageDetail(
      eventId: proto.eventId,
      roomId: proto.roomId,
      senderId: proto.senderId,
      clientEventId: (proto.hasClientEventId()) ? proto.clientEventId : null,
      version: proto.version,
      attachment: proto.attachment
          .map((e) => ChatAttachmentDetail.fromProto(e))
          .toList(),
      reaction: proto.reaction
          .map((e) => RoomEventReactionDetail.fromProto(e))
          .toList(),
      content: proto.content,
      createTimestamp:
          DateTime.fromMillisecondsSinceEpoch(proto.createTimestamp.toInt()),
      updateTimestamp:
          DateTime.fromMillisecondsSinceEpoch(proto.updateTimestamp.toInt()),
    );
  }
}
