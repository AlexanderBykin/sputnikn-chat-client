import 'package:drift/drift.dart';

class User extends Table {
  TextColumn get id => text()();
  TextColumn get login => text().nullable()();
  TextColumn get password => text().nullable()();
  TextColumn get fullName => text().named("full_name")();
  TextColumn get avatar => text().nullable()();
  DateTimeColumn get dateCreate => dateTime().named("date_create")();
  DateTimeColumn get dateUpdate => dateTime().nullable().named("date_update")();

  @override
  Set<Column> get primaryKey => {id};
}