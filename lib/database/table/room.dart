import 'package:drift/drift.dart';

class Room extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get avatar => text().nullable()();
  DateTimeColumn get dateCreate => dateTime()();
  DateTimeColumn get dateUpdate => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
