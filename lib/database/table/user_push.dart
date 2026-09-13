import 'package:drift/drift.dart';
import 'package:sputnikn_chat_client/database/table/tables.dart';

class UserPush extends Table {
  TextColumn get id => text()();
  TextColumn get userId => text().references(User, #id)();
  TextColumn get deviceName => text()();
  TextColumn get token => text()();

  @override
  Set<Column> get primaryKey => {id};

  @override
  List<Set<Column>> get uniqueKeys => [
        {userId, deviceName},
      ];
}
