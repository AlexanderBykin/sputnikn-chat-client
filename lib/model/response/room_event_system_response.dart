import 'package:sputnikn_chat_client/generated/chat_message.pb.dart' as proto;
import 'package:sputnikn_chat_client/model/response/base_response.dart';
import 'package:sputnikn_chat_client/model/response/room_event_system_detail.dart';

class RoomEventSystemResponse extends BaseResponse {
  const RoomEventSystemResponse({
    required this.detail,
  });

  final RoomEventSystemDetail detail;

  static RoomEventSystemResponse fromProto(proto.RoomEventSystemReply data) {
    return RoomEventSystemResponse(
      detail: RoomEventSystemDetail.fromProto(data.detail),
    );
  }
}
