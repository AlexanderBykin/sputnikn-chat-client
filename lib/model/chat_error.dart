class ChatError extends Error {
  ChatError(
    this.message,
    this.stackTraceString,
  );

  final String message;
  final String stackTraceString;
}
