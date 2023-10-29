import 'package:sputnikn_chat_client/generated/chat_message.pb.dart' as proto;

class UserDetail {
  const UserDetail({
    required this.userId,
    required this.fullName,
    required this.avatar,
  });

  final String userId;
  final String fullName;
  final String? avatar;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserDetail &&
          runtimeType == other.runtimeType &&
          userId == other.userId;

  @override
  int get hashCode => userId.hashCode;

  static UserDetail fromProto(proto.UserDetail data) {
    return UserDetail(
      userId: data.userId,
      fullName: data.fullName,
      avatar: (data.hasAvatar()) ? data.avatar : null,
    );
  }
}
