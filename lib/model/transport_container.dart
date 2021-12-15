import 'dart:typed_data';

class TransportContainer {
  final int msgId;
  final Uint8List bytes;

  TransportContainer(
    this.msgId,
    this.bytes,
  );
}
