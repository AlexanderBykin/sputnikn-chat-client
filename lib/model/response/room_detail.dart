import 'package:sputnikn_chat_client/generated/chat_message.pb.dart' as Proto;
import './room_member_detail.dart';

class RoomDetail {
  final String roomId;
  final String title;
  final String? avatar;
  final List<RoomMemberDetail> members;
  final int eventMessageUnreadCount;
  final int eventSystemUnreadCount;

  RoomDetail({
    required this.roomId,
    required this.title,
    required this.avatar,
    required this.members,
    required this.eventMessageUnreadCount,
    required this.eventSystemUnreadCount,
  });

  static RoomDetail fromProto(Proto.RoomDetail proto) {
    return RoomDetail(
      roomId: proto.roomId,
      title: proto.title,
      avatar: (proto.hasAvatar()) ? proto.avatar : null,
      members: proto.members.map((e) => RoomMemberDetail.fromProto(e)).toList(),
      eventMessageUnreadCount: proto.eventMessageUnreadCount,
      eventSystemUnreadCount: proto.eventSystemUnreadCount,
    );
  }
}
