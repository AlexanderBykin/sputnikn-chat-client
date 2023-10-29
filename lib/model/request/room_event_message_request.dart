import 'package:sputnikn_chat_client/generated/chat_message.pb.dart' as proto;
import 'package:sputnikn_chat_client/model/request/base_request.dart';

class RoomEventMessageRequest extends BaseRequest<proto.RoomEventMessage> {
  const RoomEventMessageRequest({
    required this.userId,
    required this.roomId,
    required this.attachment,
    required this.content,
    required this.version,
    this.clientEventId = -1,
  });

  final String userId;
  final String roomId;
  final List<String> attachment;
  // Important field: will be filled inside Isolate
  final int clientEventId;
  final String content;
  final int version;

  RoomEventMessageRequest copyWith({
    int? clientEventId,
  }) {
    return RoomEventMessageRequest(
      userId: userId,
      roomId: roomId,
      attachment: attachment,
      clientEventId: clientEventId ?? this.clientEventId,
      content: content,
      version: version,
    );
  }

  @override
  proto.RoomEventMessage toProto() {
    return proto.RoomEventMessage(
      roomId: roomId,
      attachment: attachment,
      clientEventId: clientEventId,
      content: content,
      version: version,
    );
  }
}
