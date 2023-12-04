import 'package:drift/drift.dart';
import 'package:sputnikn_chat_client/database/table/tables.dart';

class RoomEventMessage extends Table {
  TextColumn get id => text()();
  TextColumn get roomId => text().references(Room, #id)();
  TextColumn get userId => text().references(User, #id)();
  TextColumn get content => text()();
  IntColumn get version => integer()();
  IntColumn get clientEventId => integer().nullable()();
  DateTimeColumn get dateCreate => dateTime()();
  DateTimeColumn get dateEdit => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
