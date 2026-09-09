class QueueRequest {
  const QueueRequest(
    this.queueId,
    this.data,
    this.isOffline,
  );

  final int queueId;
  final Object data;
  final bool isOffline;
}
