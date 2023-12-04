import 'package:drift/drift.dart';

class RoomEventSystem extends Table {
  TextColumn get id => text()();
  TextColumn get roomId => text()();
  IntColumn get version => integer()();
  TextColumn get content => text()();
  DateTimeColumn get dateCreate => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
