import 'package:sputnikn_chat_client/generated/chat_message.pb.dart' as proto;

class RoomEventSystemDetail {
  const RoomEventSystemDetail({
    required this.eventId,
    required this.roomId,
    required this.version,
    required this.content,
    required this.createTimestamp,
  });

  final String eventId;
  final String roomId;
  final int version;
  final String content;
  final DateTime createTimestamp;

  static RoomEventSystemDetail fromProto(proto.RoomEventSystemDetail data) {
    return RoomEventSystemDetail(
      eventId: data.eventId,
      roomId: data.roomId,
      version: data.version,
      content: data.content,
      createTimestamp: DateTime.fromMillisecondsSinceEpoch(
        data.createTimestamp.toInt(),
      ),
    );
  }
}
