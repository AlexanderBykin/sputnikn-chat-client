import 'package:sputnikn_chat_client/generated/chat_message.pb.dart' as proto;
import 'package:sputnikn_chat_client/model/response/base_response.dart';
import 'package:sputnikn_chat_client/model/response/room_detail.dart';

class ListRoomsResponse extends BaseResponse {
  const ListRoomsResponse({
    required this.detail,
  });

  final List<RoomDetail> detail;

  static ListRoomsResponse fromProto(proto.ListRoomsReply data) {
    return ListRoomsResponse(
      detail: data.detail.map(RoomDetail.fromProto).toList(),
    );
  }
}
