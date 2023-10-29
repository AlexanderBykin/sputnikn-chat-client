import 'package:sputnikn_chat_client/generated/chat_message.pb.dart' as proto;
import 'package:sputnikn_chat_client/model/response/base_response.dart';
import 'package:sputnikn_chat_client/model/response/room_event_message_detail.dart';

class RoomEventMessageResponse extends BaseResponse {
  const RoomEventMessageResponse({
    required this.detail,
  });

  final RoomEventMessageDetail detail;

  static RoomEventMessageResponse fromProto(proto.RoomEventMessageReply data) {
    return RoomEventMessageResponse(
      detail: RoomEventMessageDetail.fromProto(data.detail),
    );
  }
}
