import 'package:sputnikn_chat_client/generated/chat_message.pb.dart' as proto;
import 'package:sputnikn_chat_client/model/response/base_response.dart';
import 'package:sputnikn_chat_client/model/response/room_detail.dart';

class RoomStateChangedResponse extends BaseResponse {
  const RoomStateChangedResponse({
    required this.detail,
  });

  final RoomDetail detail;

  static RoomStateChangedResponse fromProto(proto.RoomStateChangedReply data) {
    return RoomStateChangedResponse(
      detail: RoomDetail.fromProto(data.detail),
    );
  }
}
