enum SocketStateType {
  socketStateTypeReady,
  socketStateTypeConnected,
  socketStateTypeDisconnected,
}

class SocketState {
  final SocketStateType state;

  SocketState(this.state);
}
