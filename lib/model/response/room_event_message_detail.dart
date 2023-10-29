import 'package:sputnikn_chat_client/sputnikn_chat_client.dart';
import 'package:sputnikn_chat_client/generated/chat_message.pb.dart' as proto;

class RoomEventMessageDetail {
  const RoomEventMessageDetail({
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

  static RoomEventMessageDetail fromProto(proto.RoomEventMessageDetail data) {
    return RoomEventMessageDetail(
      eventId: data.eventId,
      roomId: data.roomId,
      senderId: data.senderId,
      clientEventId: (data.hasClientEventId()) ? data.clientEventId : null,
      version: data.version,
      attachment: data.attachment.map(ChatAttachmentDetail.fromProto).toList(),
      reaction: data.reaction.map(RoomEventReactionDetail.fromProto).toList(),
      content: data.content,
      createTimestamp:
          DateTime.fromMillisecondsSinceEpoch(data.createTimestamp.toInt()),
      updateTimestamp:
          DateTime.fromMillisecondsSinceEpoch(data.updateTimestamp.toInt()),
    );
  }
}
