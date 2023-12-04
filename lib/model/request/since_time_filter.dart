// ignore_for_file: no_default_cases

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:sputnikn_chat_client/generated/chat_message.pb.dart' as proto;
import 'package:sputnikn_chat_client/model/request_proto_mixin.dart';

enum SinceTimeOrderType {
  sinceTimeOrderTypeNewest,
  sinceTimeOrderTypeOldest,
}

class SinceTimeFilter with RequestProtoMixin<proto.SinceTimeFilter> {
  const SinceTimeFilter({
    required this.sinceTime,
    required this.orderType,
  });

  final DateTime sinceTime;
  final SinceTimeOrderType orderType;

  @override
  proto.SinceTimeFilter toProto() {
    return proto.SinceTimeFilter(
      sinceTimestamp: $fixnum.Int64(sinceTime.millisecondsSinceEpoch),
      orderType: orderTypeToProto(),
    );
  }

  proto.SinceTimeOrderType orderTypeToProto() {
    switch (orderType) {
      case SinceTimeOrderType.sinceTimeOrderTypeNewest:
        return proto.SinceTimeOrderType.sinceTimeOrderTypeNewest;
      case SinceTimeOrderType.sinceTimeOrderTypeOldest:
        return proto.SinceTimeOrderType.sinceTimeOrderTypeOldest;
      default:
        return proto.SinceTimeOrderType.sinceTimeOrderTypeNewest;
    }
  }
}
