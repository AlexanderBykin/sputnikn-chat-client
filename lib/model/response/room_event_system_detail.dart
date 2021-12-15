import 'package:sputnikn_chat_client/generated/chat_message.pb.dart' as Proto;

class RoomEventSystemDetail {
  final String eventId;
  final String roomId;
  final int version;
  final String content;
  final DateTime createTimestamp;

  RoomEventSystemDetail({
    required this.eventId,
    required this.roomId,
    required this.version,
    required this.content,
    required this.createTimestamp,
  });

  static RoomEventSystemDetail fromProto(Proto.RoomEventSystemDetail proto) {
    return RoomEventSystemDetail(
      eventId: proto.eventId,
      roomId: proto.roomId,
      version: proto.version,
      content: proto.content,
      createTimestamp:
          DateTime.fromMillisecondsSinceEpoch(proto.createTimestamp.toInt()),
    );
  }
}
