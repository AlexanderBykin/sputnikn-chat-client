import 'package:sputnikn_chat_client/generated/chat_message.pb.dart' as proto;

class RoomEventReactionDetail {
  const RoomEventReactionDetail({
    required this.eventId,
    required this.roomId,
    required this.senderId,
    required this.content,
    required this.timestamp,
  });

  final String eventId;
  final String roomId;
  final String senderId;
  final String content;
  final DateTime timestamp;

  static RoomEventReactionDetail fromProto(
    proto.RoomEventReactionDetail data,
  ) {
    return RoomEventReactionDetail(
      eventId: data.eventId,
      roomId: data.roomId,
      senderId: data.senderId,
      content: data.content,
      timestamp: DateTime.fromMillisecondsSinceEpoch(data.timestamp.toInt()),
    );
  }
}
