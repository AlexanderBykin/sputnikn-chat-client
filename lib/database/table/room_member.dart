import 'package:drift/drift.dart';
import 'package:sputnikn_chat_client/database/table/tables.dart';

enum MemberStatus {
  memberStatusTypeInvited,
  memberStatusTypeJoined,
  memberStatusTypeLeft,
  memberStatusTypeKicked,
  memberStatusTypeBanned
}

class RoomMember extends Table {
  TextColumn get roomId => text().references(Room, #id)();
  TextColumn get userId => text().references(User, #id)();
  IntColumn get memberStatus => intEnum<MemberStatus>()();
  IntColumn get permission => integer()();
  DateTimeColumn get lastReadMarker => dateTime().nullable()();
  DateTimeColumn get dateCreate => dateTime()();
  DateTimeColumn get dateUpdate => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {roomId, userId};
}
