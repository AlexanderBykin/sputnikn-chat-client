import 'package:drift/drift.dart';

class RoomEventMessageReaction extends Table {
  TextColumn get id => text()();
  TextColumn get roomEventMessageId => text().named("room_event_message_id")();
  TextColumn get userId => text().named("user_id")();
  TextColumn get content => text()();
  DateTimeColumn get dateCreate => dateTime().named("date_create")();

  @override
  Set<Column> get primaryKey => {id};

  @override
  List<String> get customConstraints => [
    'UNIQUE (room_event_message_id, user_id)',
    'FOREIGN KEY(room_event_message_id) REFERENCES room_event_message(id)',
    'FOREIGN KEY(user_id) REFERENCES users(id)',
  ];
}