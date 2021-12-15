import 'package:sputnikn_chat_client/generated/chat_message.pb.dart' as Proto;

class UserDetail {
  final String userId;
  final String fullName;
  final String? avatar;

  UserDetail({
    required this.userId,
    required this.fullName,
    required this.avatar,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserDetail &&
          runtimeType == other.runtimeType &&
          userId == other.userId;

  @override
  int get hashCode => userId.hashCode;

  static UserDetail fromProto(Proto.UserDetail proto) {
    return UserDetail(
      userId: proto.userId,
      fullName: proto.fullName,
      avatar: (proto.hasAvatar()) ? proto.avatar : null,
    );
  }
}
