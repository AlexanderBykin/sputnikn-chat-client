import 'package:drift/drift.dart';

class RoomEventSystem extends Table {
  TextColumn get id => text()();
  TextColumn get roomId => text().named("room_id")();
  IntColumn get version => integer()();
  TextColumn get content => text()();
  DateTimeColumn get dateCreate => dateTime().named("date_create")();

  @override
  Set<Column> get primaryKey => {id};
}