import 'package:sputnikn_chat_client/model/chat_error.dart';

class QueueResponse {
  const QueueResponse(
    this.responseId,
    this.error,
    this.data,
  );

  factory QueueResponse.success(int responseId, Object data) {
    return QueueResponse(
      responseId,
      null,
      data,
    );
  }

  factory QueueResponse.failure(int responseId, ChatError error) {
    return QueueResponse(
      responseId,
      error,
      null,
    );
  }

  final int responseId;
  final ChatError? error;
  final Object? data;
}
