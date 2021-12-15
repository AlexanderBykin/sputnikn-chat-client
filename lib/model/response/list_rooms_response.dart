import 'package:sputnikn_chat_client/generated/chat_message.pb.dart' as Proto;
import 'package:sputnikn_chat_client/model/response/base_response.dart';
import './room_detail.dart';

class ListRoomsResponse extends BaseResponse {
  final List<RoomDetail> detail;

  ListRoomsResponse({
    required this.detail,
  });

  static ListRoomsResponse fromProto(Proto.ListRoomsReply proto) {
    return ListRoomsResponse(
      detail: proto.detail.map((e) => RoomDetail.fromProto(e)).toList(),
    );
  }
}
