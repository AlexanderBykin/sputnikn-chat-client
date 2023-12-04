import 'package:drift/drift.dart';

class User extends Table {
  TextColumn get id => text()();
  TextColumn get login => text().nullable()();
  TextColumn get password => text().nullable()();
  TextColumn get fullName => text()();
  TextColumn get avatar => text().nullable()();
  DateTimeColumn get dateCreate => dateTime()();
  DateTimeColumn get dateUpdate => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
