enum SocketStateType {
  socketStateTypeReady,
  socketStateTypeConnected,
  socketStateTypeDisconnected,
}

class SocketState {
  const SocketState(this.state);

  final SocketStateType state;
}
