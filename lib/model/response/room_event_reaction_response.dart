import 'package:sputnikn_chat_client/generated/chat_message.pb.dart' as proto;
import 'package:sputnikn_chat_client/model/response/base_response.dart';
import 'package:sputnikn_chat_client/model/response/room_event_reaction_detail.dart';

class RoomEventReactionResponse extends BaseResponse {
  const RoomEventReactionResponse({
    required this.detail,
  });

  final RoomEventReactionDetail detail;

  static RoomEventReactionResponse fromProto(
    proto.RoomEventReactionReply data,
  ) {
    return RoomEventReactionResponse(
      detail: RoomEventReactionDetail.fromProto(data.detail),
    );
  }
}
