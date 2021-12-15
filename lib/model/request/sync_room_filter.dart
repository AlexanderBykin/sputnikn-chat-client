import 'package:sputnikn_chat_client/generated/chat_message.pb.dart' as Proto;
import 'package:sputnikn_chat_client/model/request/since_time_filter.dart';
import 'package:sputnikn_chat_client/model/request_proto_mixin.dart';

enum RoomEventType {
  roomEventTypeAll,
  roomEventTypeMessage,
  roomEventTypeSystem,
}

class SyncRoomFilter with RequestProtoMixin<Proto.SyncRoomFilter> {
  final String roomId;
  final SinceTimeFilter? sinceTimeFilter;
  final RoomEventType eventFilter;
  final int eventLimit;

  SyncRoomFilter({
    required this.roomId,
    required this.sinceTimeFilter,
    required this.eventFilter,
    required this.eventLimit,
  });

  @override
  Proto.SyncRoomFilter toProto() {
    return Proto.SyncRoomFilter(
      roomId: roomId,
      sinceFilter: sinceTimeFilter?.toProto(),
      eventFilter: eventFilterToProto(eventFilter),
      eventLimit: eventLimit,
    );
  }

  Proto.RoomEventType eventFilterToProto(RoomEventType eventType) {
    switch (eventType) {
      case RoomEventType.roomEventTypeAll:
        return Proto.RoomEventType.roomEventTypeAll;
      case RoomEventType.roomEventTypeMessage:
        return Proto.RoomEventType.roomEventTypeMessage;
      case RoomEventType.roomEventTypeSystem:
        return Proto.RoomEventType.roomEventTypeSystem;
      default:
        return Proto.RoomEventType.roomEventTypeAll;
    }
  }
}
