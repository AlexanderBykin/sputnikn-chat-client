import 'package:sputnikn_chat_client/generated/chat_message.pb.dart' as Proto;
import 'package:sputnikn_chat_client/model/request/base_request.dart';

class RoomEventReactionRequest extends BaseRequest<Proto.RoomEventReaction> {
  final String roomId;
  final String messageId;
  final String content;
  final int clientEventId;

  RoomEventReactionRequest({
    required this.roomId,
    required this.messageId,
    required this.content,
    required this.clientEventId,
  });

  @override
  Proto.RoomEventReaction toProto() {
    return Proto.RoomEventReaction(
      roomId: roomId,
      messageId: messageId,
      clientEventId: clientEventId,
      content: content,
    );
  }
}
