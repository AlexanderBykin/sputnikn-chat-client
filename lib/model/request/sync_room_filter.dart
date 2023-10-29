// ignore_for_file: no_default_cases

import 'package:sputnikn_chat_client/generated/chat_message.pb.dart' as proto;
import 'package:sputnikn_chat_client/model/request/since_time_filter.dart';
import 'package:sputnikn_chat_client/model/request_proto_mixin.dart';

enum RoomEventType {
  roomEventTypeAll,
  roomEventTypeMessage,
  roomEventTypeSystem,
}

class SyncRoomFilter with RequestProtoMixin<proto.SyncRoomFilter> {
  const SyncRoomFilter({
    required this.roomId,
    required this.sinceTimeFilter,
    required this.eventFilter,
    required this.eventLimit,
  });

  final String roomId;
  final SinceTimeFilter? sinceTimeFilter;
  final RoomEventType eventFilter;
  final int eventLimit;

  @override
  proto.SyncRoomFilter toProto() {
    return proto.SyncRoomFilter(
      roomId: roomId,
      sinceFilter: sinceTimeFilter?.toProto(),
      eventFilter: eventFilterToProto(eventFilter),
      eventLimit: eventLimit,
    );
  }

  proto.RoomEventType eventFilterToProto(RoomEventType eventType) {
    switch (eventType) {
      case RoomEventType.roomEventTypeAll:
        return proto.RoomEventType.roomEventTypeAll;
      case RoomEventType.roomEventTypeMessage:
        return proto.RoomEventType.roomEventTypeMessage;
      case RoomEventType.roomEventTypeSystem:
        return proto.RoomEventType.roomEventTypeSystem;
      default:
        return proto.RoomEventType.roomEventTypeAll;
    }
  }
}
