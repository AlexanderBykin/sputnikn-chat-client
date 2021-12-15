import 'package:sputnikn_chat_client/generated/chat_message.pb.dart' as Proto;
import 'package:sputnikn_chat_client/model/request/base_request.dart';
import 'package:sputnikn_chat_client/model/request/sync_room_filter.dart';

class SyncRoomsRequest extends BaseRequest {
  final List<SyncRoomFilter> roomFilter;

  SyncRoomsRequest({
    required this.roomFilter,
  });

  @override
  Proto.SyncRooms toProto() {
    return Proto.SyncRooms(
      roomFilter: roomFilter.map((e) => e.toProto()).toList(),
    );
  }
}
