import 'package:drift/drift.dart';

class UserPush extends Table {
  TextColumn get id => text()();
  TextColumn get userId => text().named("user_id")();
  TextColumn get deviceName => text().named("device_name")();
  TextColumn get token => text()();

  @override
  Set<Column> get primaryKey => {id};

  @override
  List<String> get customConstraints => [
    'UNIQUE (user_id, device_name)',
    'FOREIGN KEY(user_id) REFERENCES users(id)'
  ];
}