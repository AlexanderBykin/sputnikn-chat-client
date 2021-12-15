import 'package:sputnikn_chat_client/generated/chat_message.pb.dart' as Proto;
import 'package:sputnikn_chat_client/model/response/room_event_system_detail.dart';
import './room_event_message_detail.dart';
import './base_response.dart';

class SyncRoomsResponse extends BaseResponse {
  final List<RoomEventMessageDetail> messageEvents;
  final List<RoomEventSystemDetail> systemEvents;

  SyncRoomsResponse({
    required this.messageEvents,
    required this.systemEvents,
  });

  static SyncRoomsResponse fromProto(Proto.SyncRoomsReply proto) {
    return SyncRoomsResponse(
      messageEvents: proto.messageEvents
          .map((e) => RoomEventMessageDetail.fromProto(e))
          .toList(),
      systemEvents: proto.systemEvents
          .map((e) => RoomEventSystemDetail.fromProto(e))
          .toList(),
    );
  }
}
