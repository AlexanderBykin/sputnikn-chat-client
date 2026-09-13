import 'package:drift/drift.dart';
import 'package:sputnikn_chat_client/database/table/tables.dart';

class RoomEventMessageReaction extends Table {
  TextColumn get id => text()();
  TextColumn get roomEventMessageId =>
      text().references(RoomEventMessage, #id)();
  TextColumn get userId => text().references(User, #id)();
  TextColumn get content => text()();
  DateTimeColumn get dateCreate => dateTime()();

  @override
  Set<Column> get primaryKey => {id};

  @override
  List<Set<Column>> get uniqueKeys => [
        {roomEventMessageId, userId},
      ];
}
