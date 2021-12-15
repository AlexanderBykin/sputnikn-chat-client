import 'package:protobuf/protobuf.dart';
import '../request_proto_mixin.dart';

abstract class BaseRequest<T extends GeneratedMessage>
    with RequestProtoMixin<T> {}

class QueueRequest {
  final int queueId;
  final BaseRequest request;
  final bool isOffline;

  QueueRequest(this.queueId, this.request, this.isOffline);
}
