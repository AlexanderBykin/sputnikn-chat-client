import 'package:drift/drift.dart';

class RoomEventMessageAttachment extends Table {
  TextColumn get id => text()();
  TextColumn get roomEventMessageId => text().named("room_event_message_id")();
  TextColumn get chatAttachmentId => text().named("chat_attachment_id")();
  TextColumn get mimeType => text().named("mime_type")();
  DateTimeColumn get dateCreate => dateTime().named("date_create")();

  @override
  Set<Column> get primaryKey => {id};

  @override
  List<String> get customConstraints => [
    'UNIQUE (room_event_message_id, chat_attachment_id)',
    'FOREIGN KEY(room_event_message_id) REFERENCES room_event_message(id)',
  ];
}