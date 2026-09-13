# SputnikN chat client
SpitnikN sdk chat client written with Flutter

### Repositories overview
The chat ecosystem consists of several dependent repositories:<br>
- [Transport Contract code gen](https://github.com/AlexanderBykin/sputnikn-chat-contract) - Transport gRPC contract generator between Client and Server;<br>
- [Chat server](https://github.com/AlexanderBykin/sputnikn-chat-server-go) - High loaded and scalable chat server written with Golang;<br>
- [Client chat SDK](https://github.com/AlexanderBykin/sputnikn-chat-client) - SDK client chat library for embedding in third-party applications written in Flutter;<br>
- [Sample application](https://github.com/AlexanderBykin/sputnikn-chat-sample) - An example of a chat application using the SDK client library written with Flutter;<br>

### Code generation
To generate classes once run in console:<br>
`flutter pub run build_runner build --delete-conflicting-outputs`
