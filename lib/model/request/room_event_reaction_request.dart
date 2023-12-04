import 'package:sputnikn_chat_client/generated/chat_message.pb.dart' as proto;
import 'package:sputnikn_chat_client/model/request/base_request.dart';

class RoomEventReactionRequest extends BaseRequest<proto.RoomEventReaction> {
  const RoomEventReactionRequest({
    required this.roomId,
    required this.messageId,
    required this.content,
    required this.clientEventId,
  });

  final String roomId;
  final String messageId;
  final String content;
  final int clientEventId;

  @override
  proto.RoomEventReaction toProto() {
    return proto.RoomEventReaction(
      roomId: roomId,
      messageId: messageId,
      clientEventId: clientEventId,
      content: content,
    );
  }
}
