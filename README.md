# SputnikN chat client
SpitnikN sdk chat client written with Flutter

### Repositories overview
The chat ecosystem consists of several dependent repositories:<br>
- [Database code gen](https://github.com/AlexanderShniperson/sputnikn-chat-codegen-db) - Class generator according to the DB schema, the DB schema is attached;<br>
- [Transport code gen](https://github.com/AlexanderShniperson/sputnikn-chat-codegen-proto) - Transport message generator between Client and Server;<br>
- [Chat server](https://github.com/AlexanderShniperson/sputnikn-chat-server) - High loaded and scalable chat server written with Akka/Ktor/Rest/WebSocket/Protobuf/Jooq;<br>
- [Client chat SDK](https://github.com/AlexanderShniperson/sputnikn-chat-client) - SDK client chat library for embedding in third-party applications written in Flutter;<br>
- [Sample application](https://github.com/AlexanderShniperson/sputnikn-chat-sample) - An example of a chat application using the SDK client library written with Flutter;<br>

### Code generation
To generate classes once run in console:<br>
`flutter pub run build_runner build --delete-conflicting-outputs`
