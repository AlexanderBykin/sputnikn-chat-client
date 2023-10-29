import 'package:protobuf/protobuf.dart';

mixin RequestProtoMixin<T extends GeneratedMessage> {
  T toProto();
}
