import 'package:drift/drift.dart';

class Room extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get avatar => text().nullable()();
  DateTimeColumn get dateCreate => dateTime().named("date_create")();
  DateTimeColumn get dateUpdate => dateTime().named("date_update").nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
