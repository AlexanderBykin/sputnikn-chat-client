import 'package:sputnikn_chat_client/generated/chat_message.pb.dart' as proto;
import 'package:sputnikn_chat_client/model/request/base_request.dart';
import 'package:sputnikn_chat_client/model/request/sync_room_filter.dart';

class SyncRoomsRequest extends BaseRequest<proto.SyncRooms> {
  const SyncRoomsRequest({
    required this.roomFilter,
  });

  final List<SyncRoomFilter> roomFilter;

  @override
  proto.SyncRooms toProto() {
    return proto.SyncRooms(
      roomFilter: roomFilter.map((e) => e.toProto()).toList(),
    );
  }
}
