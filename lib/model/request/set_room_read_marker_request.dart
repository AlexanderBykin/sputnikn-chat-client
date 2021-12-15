import 'package:sputnikn_chat_client/generated/chat_message.pb.dart';
import 'package:sputnikn_chat_client/model/request/base_request.dart';
import 'package:fixnum/fixnum.dart' as $fixnum;

class SetRoomReadMarkerRequest extends BaseRequest<SetRoomReadMarker> {
  final String roomId;
  final DateTime readMarkerTimestamp;

  SetRoomReadMarkerRequest({
    required this.roomId,
    required this.readMarkerTimestamp,
  });

  @override
  SetRoomReadMarker toProto() {
    return SetRoomReadMarker(
      roomId: roomId,
      readMarkerTimestamp:
          $fixnum.Int64(readMarkerTimestamp.millisecondsSinceEpoch),
    );
  }
}
