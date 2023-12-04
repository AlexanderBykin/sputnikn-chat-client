// ignore_for_file: no_default_cases

import 'package:sputnikn_chat_client/generated/chat_message.pb.dart' as proto;

abstract class BaseResponse {
  const BaseResponse();
}

enum ApiResponseError {
  apiResponseErrorNone,
  apiResponseErrorInternalError,
  apiResponseErrorUserNeedAuth,
  apiResponseErrorUserWrongPassword,
  apiResponseErrorUserNotFound,
  apiResponseErrorRoomRequiredMinMembers,
}

ApiResponseError apiResponseErrorFromProto(proto.ResponseErrorType data) {
  switch (data) {
    case proto.ResponseErrorType.responseErrorTypeNone:
      return ApiResponseError.apiResponseErrorNone;
    case proto.ResponseErrorType.responseErrorTypeInternalError:
      return ApiResponseError.apiResponseErrorInternalError;
    case proto.ResponseErrorType.responseErrorTypeUserNeedAuth:
      return ApiResponseError.apiResponseErrorUserNeedAuth;
    case proto.ResponseErrorType.responseErrorTypeUserNotFound:
      return ApiResponseError.apiResponseErrorUserNotFound;
    case proto.ResponseErrorType.responseErrorTypeUserWrongPassword:
      return ApiResponseError.apiResponseErrorUserWrongPassword;
    case proto.ResponseErrorType.responseErrorTypeRoomRequiredMinMembers:
      return ApiResponseError.apiResponseErrorRoomRequiredMinMembers;
    default:
      return ApiResponseError.apiResponseErrorNone;
  }
}

class QueueResponse extends BaseResponse {
  const QueueResponse(
    this.responseId,
    this.error,
    this.data,
  );

  final int responseId;
  final ApiResponseError error;
  final BaseResponse? data;
}
