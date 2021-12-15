import 'package:sputnikn_chat_client/generated/chat_message.pb.dart' as Proto;
import './base_request.dart';

class ListRoomsRequest extends BaseRequest<Proto.ListRooms> {
  final String userId;
  final Set<String> roomIds;

  ListRoomsRequest({
    required this.userId,
    required this.roomIds,
  });

  @override
  Proto.ListRooms toProto() {
    return Proto.ListRooms(
      roomIds: roomIds.toList(),
    );
  }
}
