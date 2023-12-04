import 'package:sputnikn_chat_client/generated/chat_message.pb.dart' as proto;
import 'package:sputnikn_chat_client/model/request/base_request.dart';

class ListRoomsRequest extends BaseRequest<proto.ListRooms> {
  const ListRoomsRequest({
    required this.userId,
    required this.roomIds,
  });

  final String userId;
  final Set<String> roomIds;

  @override
  proto.ListRooms toProto() {
    return proto.ListRooms(
      roomIds: roomIds.toList(),
    );
  }
}
