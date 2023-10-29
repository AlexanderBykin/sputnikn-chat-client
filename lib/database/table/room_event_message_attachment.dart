import 'package:drift/drift.dart';
import 'package:sputnikn_chat_client/database/table/tables.dart';

class RoomEventMessageAttachment extends Table {
  TextColumn get id => text()();
  TextColumn get roomEventMessageId =>
      text().references(RoomEventMessage, #id)();
  TextColumn get chatAttachmentId => text()();
  TextColumn get mimeType => text()();
  DateTimeColumn get dateCreate => dateTime()();

  @override
  Set<Column> get primaryKey => {id};

  @override
  List<Set<Column>> get uniqueKeys => [
        {roomEventMessageId, chatAttachmentId},
      ];
}
