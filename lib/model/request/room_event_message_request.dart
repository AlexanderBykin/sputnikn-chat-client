import 'package:sputnikn_chat_client/generated/chat_message.pb.dart';
import 'package:sputnikn_chat_client/model/request/base_request.dart';

class RoomEventMessageRequest extends BaseRequest<RoomEventMessage> {
  final String userId;
  final String roomId;
  final List<String> attachment;
  // Important field: will be filled inside Isolate
  int? clientEventId;
  final String content;
  final int version;

  RoomEventMessageRequest({
    required this.userId,
    required this.roomId,
    required this.attachment,
    this.clientEventId,
    required this.content,
    required this.version,
  });

  @override
  RoomEventMessage toProto() {
    return RoomEventMessage(
      roomId: roomId,
      attachment: attachment,
      clientEventId: clientEventId,
      content: content,
      version: version,
    );
  }
}
