import 'package:sputnikn_chat_client/generated/chat_message.pb.dart' as Proto;
import 'package:sputnikn_chat_client/model/request_proto_mixin.dart';
import 'package:fixnum/fixnum.dart' as $fixnum;

enum SinceTimeOrderType {
  sinceTimeOrderTypeNewest,
  sinceTimeOrderTypeOldest,
}

class SinceTimeFilter with RequestProtoMixin<Proto.SinceTimeFilter> {
  final DateTime sinceTime;
  final SinceTimeOrderType orderType;

  SinceTimeFilter({
    required this.sinceTime,
    required this.orderType,
  });

  @override
  Proto.SinceTimeFilter toProto() {
    return Proto.SinceTimeFilter(
      sinceTimestamp: $fixnum.Int64(sinceTime.millisecondsSinceEpoch),
      orderType: orderTypeToProto(),
    );
  }

  Proto.SinceTimeOrderType orderTypeToProto() {
    switch (orderType) {
      case SinceTimeOrderType.sinceTimeOrderTypeNewest:
        return Proto.SinceTimeOrderType.sinceTimeOrderTypeNewest;
      case SinceTimeOrderType.sinceTimeOrderTypeOldest:
        return Proto.SinceTimeOrderType.sinceTimeOrderTypeOldest;
      default:
        return Proto.SinceTimeOrderType.sinceTimeOrderTypeNewest;
    }
  }
}
