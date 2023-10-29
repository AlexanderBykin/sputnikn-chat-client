import 'dart:typed_data';

class TransportContainer {
  const TransportContainer(
    this.msgId,
    this.bytes,
  );

  final int msgId;
  final Uint8List bytes;
}
