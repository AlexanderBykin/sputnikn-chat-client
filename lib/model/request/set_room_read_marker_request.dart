import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:sputnikn_chat_client/generated/chat_message.pb.dart' as proto;
import 'package:sputnikn_chat_client/model/request/base_request.dart';

class SetRoomReadMarkerRequest extends BaseRequest<proto.SetRoomReadMarker> {
  const SetRoomReadMarkerRequest({
    required this.roomId,
    required this.readMarkerTimestamp,
  });

  final String roomId;
  final DateTime readMarkerTimestamp;

  @override
  proto.SetRoomReadMarker toProto() {
    return proto.SetRoomReadMarker(
      roomId: roomId,
      readMarkerTimestamp: $fixnum.Int64(
        readMarkerTimestamp.millisecondsSinceEpoch,
      ),
    );
  }
}
