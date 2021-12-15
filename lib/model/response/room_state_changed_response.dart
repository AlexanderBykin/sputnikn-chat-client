import 'package:sputnikn_chat_client/generated/chat_message.pb.dart' as Proto;
import 'package:sputnikn_chat_client/model/response/base_response.dart';
import 'package:sputnikn_chat_client/model/response/room_detail.dart';

class RoomStateChangedResponse extends BaseResponse {
  final RoomDetail detail;

  RoomStateChangedResponse({
    required this.detail,
  });

  static RoomStateChangedResponse fromProto(Proto.RoomStateChangedReply proto) {
    return RoomStateChangedResponse(
      detail: RoomDetail.fromProto(proto.detail),
    );
  }
}
