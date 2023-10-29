import 'package:sputnikn_chat_client/generated/chat_message.pb.dart' as proto;
import 'package:sputnikn_chat_client/model/response/base_response.dart';
import 'package:sputnikn_chat_client/model/response/room_event_message_detail.dart';
import 'package:sputnikn_chat_client/model/response/room_event_system_detail.dart';

class SyncRoomsResponse extends BaseResponse {
  const SyncRoomsResponse({
    required this.messageEvents,
    required this.systemEvents,
  });

  final List<RoomEventMessageDetail> messageEvents;
  final List<RoomEventSystemDetail> systemEvents;

  static SyncRoomsResponse fromProto(proto.SyncRoomsReply data) {
    return SyncRoomsResponse(
      messageEvents:
          data.messageEvents.map(RoomEventMessageDetail.fromProto).toList(),
      systemEvents:
          data.systemEvents.map(RoomEventSystemDetail.fromProto).toList(),
    );
  }
}
