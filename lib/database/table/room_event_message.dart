import 'package:drift/drift.dart';

class RoomEventMessage extends Table {
  TextColumn get id => text()();
  TextColumn get roomId => text().named("room_id")();
  TextColumn get userId => text().named("user_id")();
  TextColumn get content => text()();
  IntColumn get version => integer()();
  IntColumn get clientEventId => integer().named("client_event_id").nullable()();
  DateTimeColumn get dateCreate => dateTime().named("date_create")();
  DateTimeColumn get dateEdit => dateTime().named("date_edit")();

  @override
  Set<Column> get primaryKey => {id};
}