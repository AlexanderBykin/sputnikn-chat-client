import 'package:protobuf/protobuf.dart';
import 'package:sputnikn_chat_client/model/request_proto_mixin.dart';

abstract class BaseRequest<T extends GeneratedMessage>
    with RequestProtoMixin<T> {
  const BaseRequest();
}

class QueueRequest {
  const QueueRequest(
    this.queueId,
    this.request,
    this.isOffline,
  );

  final int queueId;
  final BaseRequest request;
  final bool isOffline;
}
