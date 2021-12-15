import 'package:drift/drift.dart';

enum MemberStatus {
  memberStatusTypeInvited,
  memberStatusTypeJoined,
  memberStatusTypeLeft,
  memberStatusTypeKicked,
  memberStatusTypeBanned
}

class RoomMember extends Table {
  TextColumn get roomId => text().named("room_id")();
  TextColumn get userId => text().named("user_id")();
  IntColumn get memberStatus => intEnum<MemberStatus>().named("member_status")();
  IntColumn get permission => integer()();
  DateTimeColumn get lastReadMarker => dateTime().nullable().named("last_read_marker")();
  DateTimeColumn get dateCreate => dateTime().named("date_create")();
  DateTimeColumn get dateUpdate => dateTime().nullable().named("date_update")();

  @override
  Set<Column> get primaryKey => {roomId, userId};

  @override
  List<String> get customConstraints => [
    'FOREIGN KEY(room_id) REFERENCES room(id)',
    'FOREIGN KEY(user_id) REFERENCES users(id)',
  ];
}