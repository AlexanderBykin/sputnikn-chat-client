import 'package:protobuf/protobuf.dart';

abstract class SerializerBase {
  GeneratedMessage? bytesToMessage(int msgId, List<int> bytes);
  int messageToId(GeneratedMessage message);
}
