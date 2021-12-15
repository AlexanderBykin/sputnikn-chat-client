import 'package:sputnikn_chat_client/generated/chat_message.pb.dart' as Proto;
import 'package:sputnikn_chat_client/model/response/room_event_reaction_detail.dart';
import 'base_response.dart';

class RoomEventReactionResponse extends BaseResponse {
  final RoomEventReactionDetail detail;

  RoomEventReactionResponse({
    required this.detail,
  });

  static RoomEventReactionResponse fromProto(
      Proto.RoomEventReactionReply proto) {
    return RoomEventReactionResponse(
      detail: RoomEventReactionDetail.fromProto(proto.detail),
    );
  }
}
