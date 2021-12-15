import 'package:sputnikn_chat_client/generated/chat_message.pb.dart' as Proto;
import 'package:sputnikn_chat_client/model/response/base_response.dart';
import 'package:sputnikn_chat_client/model/response/room_detail.dart';

class CreateRoomResponse extends BaseResponse {
  final RoomDetail detail;

  CreateRoomResponse({
    required this.detail,
  });

  static CreateRoomResponse fromProto(Proto.CreateRoomReply proto) {
    return CreateRoomResponse(
      detail: RoomDetail.fromProto(proto.detail),
    );
  }
}
