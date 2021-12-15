import 'package:sputnikn_chat_client/generated/chat_message.pb.dart' as Proto;

class RoomEventReactionDetail {
  final String eventId;
  final String roomId;
  final String senderId;
  final String content;
  final DateTime timestamp;

  RoomEventReactionDetail({
    required this.eventId,
    required this.roomId,
    required this.senderId,
    required this.content,
    required this.timestamp,
  });

  static RoomEventReactionDetail fromProto(
    Proto.RoomEventReactionDetail proto,
  ) {
    return RoomEventReactionDetail(
      eventId: proto.eventId,
      roomId: proto.roomId,
      senderId: proto.senderId,
      content: proto.content,
      timestamp: DateTime.fromMillisecondsSinceEpoch(proto.timestamp.toInt()),
    );
  }
}
