import 'package:sputnikn_chat_client/generated/chat_message.pb.dart' as Proto;
import 'package:sputnikn_chat_client/model/response/base_response.dart';
import 'package:sputnikn_chat_client/model/response/room_event_system_detail.dart';

class RoomEventSystemResponse extends BaseResponse {
  final RoomEventSystemDetail detail;

  RoomEventSystemResponse({
    required this.detail,
  });

  static RoomEventSystemResponse fromProto(Proto.RoomEventSystemReply proto) {
    return RoomEventSystemResponse(
      detail: RoomEventSystemDetail.fromProto(proto.detail),
    );
  }
}
