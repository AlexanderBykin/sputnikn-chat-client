import 'package:sputnikn_chat_client/generated/chat_message.pb.dart' as proto;
import 'package:sputnikn_chat_client/model/response/base_response.dart';
import 'package:sputnikn_chat_client/model/response/room_detail.dart';

class CreateRoomResponse extends BaseResponse {
  const CreateRoomResponse({
    required this.detail,
  });

  final RoomDetail detail;

  static CreateRoomResponse fromProto(proto.CreateRoomReply data) {
    return CreateRoomResponse(
      detail: RoomDetail.fromProto(data.detail),
    );
  }
}
