import 'package:sputnikn_chat_client/generated/chat_message.pb.dart' as proto;
import 'package:sputnikn_chat_client/model/response/room_member_detail.dart';

class RoomDetail {
  const RoomDetail({
    required this.roomId,
    required this.title,
    required this.avatar,
    required this.members,
    required this.eventMessageUnreadCount,
    required this.eventSystemUnreadCount,
  });

  final String roomId;
  final String title;
  final String? avatar;
  final List<RoomMemberDetail> members;
  final int eventMessageUnreadCount;
  final int eventSystemUnreadCount;

  static RoomDetail fromProto(proto.RoomDetail data) {
    return RoomDetail(
      roomId: data.roomId,
      title: data.title,
      avatar: (data.hasAvatar()) ? data.avatar : null,
      members: data.members.map(RoomMemberDetail.fromProto).toList(),
      eventMessageUnreadCount: data.eventMessageUnreadCount,
      eventSystemUnreadCount: data.eventSystemUnreadCount,
    );
  }
}
