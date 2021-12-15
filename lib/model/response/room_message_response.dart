import 'package:sputnikn_chat_client/generated/chat_message.pb.dart' as Proto;
import 'package:sputnikn_chat_client/model/response/base_response.dart';
import './room_event_message_detail.dart';

class RoomEventMessageResponse extends BaseResponse {
  final RoomEventMessageDetail detail;

  RoomEventMessageResponse({
    required  this.detail,
  });

  static RoomEventMessageResponse fromProto(Proto.RoomEventMessageReply proto) {
    return RoomEventMessageResponse(
      detail: RoomEventMessageDetail.fromProto(proto.detail),
    );
  }
}
