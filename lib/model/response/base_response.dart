import 'package:sputnikn_chat_client/generated/chat_message.pb.dart' as Proto;

abstract class BaseResponse {}

enum ApiResponseError {
  apiResponseErrorNone,
  apiResponseErrorInternalError,
  apiResponseErrorUserNeedAuth,
  apiResponseErrorUserWrongPassword,
  apiResponseErrorUserNotFound,
  apiResponseErrorRoomRequiredMinMembers,
}

ApiResponseError apiResponseErrorFromProto(Proto.ResponseErrorType proto) {
  switch (proto) {
    case Proto.ResponseErrorType.responseErrorTypeNone:
      return ApiResponseError.apiResponseErrorNone;
    case Proto.ResponseErrorType.responseErrorTypeInternalError:
      return ApiResponseError.apiResponseErrorInternalError;
    case Proto.ResponseErrorType.responseErrorTypeUserNeedAuth:
      return ApiResponseError.apiResponseErrorUserNeedAuth;
    case Proto.ResponseErrorType.responseErrorTypeUserNotFound:
      return ApiResponseError.apiResponseErrorUserNotFound;
    case Proto.ResponseErrorType.responseErrorTypeUserWrongPassword:
      return ApiResponseError.apiResponseErrorUserWrongPassword;
    case Proto.ResponseErrorType.responseErrorTypeRoomRequiredMinMembers:
      return ApiResponseError.apiResponseErrorRoomRequiredMinMembers;
    default:
      return ApiResponseError.apiResponseErrorNone;
  }
}

class QueueResponse extends BaseResponse {
  final int responseId;
  final ApiResponseError error;
  final BaseResponse? data;

  QueueResponse(this.responseId, this.error, this.data);
}
