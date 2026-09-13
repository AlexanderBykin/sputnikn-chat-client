// This is a generated file - do not edit.
//
// Generated from contract.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;
import 'package:protobuf/well_known_types/google/protobuf/timestamp.pb.dart'
    as $2;

import 'contract.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'contract.pbenum.dart';

class AuthUserRequest extends $pb.GeneratedMessage {
  factory AuthUserRequest({
    $core.String? login,
    $core.String? password,
  }) {
    final result = create();
    if (login != null) result.login = login;
    if (password != null) result.password = password;
    return result;
  }

  AuthUserRequest._();

  factory AuthUserRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AuthUserRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AuthUserRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'ru.sputnikn.api.contract.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'login')
    ..aOS(2, _omitFieldNames ? '' : 'password')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AuthUserRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AuthUserRequest copyWith(void Function(AuthUserRequest) updates) =>
      super.copyWith((message) => updates(message as AuthUserRequest))
          as AuthUserRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AuthUserRequest create() => AuthUserRequest._();
  @$core.override
  AuthUserRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AuthUserRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AuthUserRequest>(create);
  static AuthUserRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get login => $_getSZ(0);
  @$pb.TagNumber(1)
  set login($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasLogin() => $_has(0);
  @$pb.TagNumber(1)
  void clearLogin() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => $_clearField(2);
}

class UserDetail extends $pb.GeneratedMessage {
  factory UserDetail({
    $core.String? userId,
    $core.String? fullName,
    $core.String? avatar,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    if (fullName != null) result.fullName = fullName;
    if (avatar != null) result.avatar = avatar;
    return result;
  }

  UserDetail._();

  factory UserDetail.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserDetail.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserDetail',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'ru.sputnikn.api.contract.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'fullName', protoName: 'fullName')
    ..aOS(3, _omitFieldNames ? '' : 'avatar')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserDetail clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserDetail copyWith(void Function(UserDetail) updates) =>
      super.copyWith((message) => updates(message as UserDetail)) as UserDetail;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserDetail create() => UserDetail._();
  @$core.override
  UserDetail createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserDetail getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserDetail>(create);
  static UserDetail? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get fullName => $_getSZ(1);
  @$pb.TagNumber(2)
  set fullName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasFullName() => $_has(1);
  @$pb.TagNumber(2)
  void clearFullName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get avatar => $_getSZ(2);
  @$pb.TagNumber(3)
  set avatar($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAvatar() => $_has(2);
  @$pb.TagNumber(3)
  void clearAvatar() => $_clearField(3);
}

class AuthUserResponse extends $pb.GeneratedMessage {
  factory AuthUserResponse({
    AuthErrorType? error,
    $core.String? accessToken,
    UserDetail? detail,
  }) {
    final result = create();
    if (error != null) result.error = error;
    if (accessToken != null) result.accessToken = accessToken;
    if (detail != null) result.detail = detail;
    return result;
  }

  AuthUserResponse._();

  factory AuthUserResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AuthUserResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AuthUserResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'ru.sputnikn.api.contract.v1'),
      createEmptyInstance: create)
    ..aE<AuthErrorType>(1, _omitFieldNames ? '' : 'error',
        enumValues: AuthErrorType.values)
    ..aOS(2, _omitFieldNames ? '' : 'accessToken', protoName: 'accessToken')
    ..aOM<UserDetail>(3, _omitFieldNames ? '' : 'detail',
        subBuilder: UserDetail.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AuthUserResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AuthUserResponse copyWith(void Function(AuthUserResponse) updates) =>
      super.copyWith((message) => updates(message as AuthUserResponse))
          as AuthUserResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AuthUserResponse create() => AuthUserResponse._();
  @$core.override
  AuthUserResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AuthUserResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AuthUserResponse>(create);
  static AuthUserResponse? _defaultInstance;

  @$pb.TagNumber(1)
  AuthErrorType get error => $_getN(0);
  @$pb.TagNumber(1)
  set error(AuthErrorType value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasError() => $_has(0);
  @$pb.TagNumber(1)
  void clearError() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get accessToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set accessToken($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAccessToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearAccessToken() => $_clearField(2);

  @$pb.TagNumber(3)
  UserDetail get detail => $_getN(2);
  @$pb.TagNumber(3)
  set detail(UserDetail value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasDetail() => $_has(2);
  @$pb.TagNumber(3)
  void clearDetail() => $_clearField(3);
  @$pb.TagNumber(3)
  UserDetail ensureDetail() => $_ensure(2);
}

class ListRoomsRequest extends $pb.GeneratedMessage {
  factory ListRoomsRequest({
    $core.Iterable<$core.String>? roomIds,
  }) {
    final result = create();
    if (roomIds != null) result.roomIds.addAll(roomIds);
    return result;
  }

  ListRoomsRequest._();

  factory ListRoomsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListRoomsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListRoomsRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'ru.sputnikn.api.contract.v1'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'roomIds', protoName: 'roomIds')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListRoomsRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListRoomsRequest copyWith(void Function(ListRoomsRequest) updates) =>
      super.copyWith((message) => updates(message as ListRoomsRequest))
          as ListRoomsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListRoomsRequest create() => ListRoomsRequest._();
  @$core.override
  ListRoomsRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListRoomsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListRoomsRequest>(create);
  static ListRoomsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get roomIds => $_getList(0);
}

class RoomMemberDetail extends $pb.GeneratedMessage {
  factory RoomMemberDetail({
    $core.String? userId,
    $core.String? fullName,
    $core.bool? isOnline,
    RoomMemberStatusType? memberStatus,
    $core.String? avatar,
    $2.Timestamp? lastReadMarker,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    if (fullName != null) result.fullName = fullName;
    if (isOnline != null) result.isOnline = isOnline;
    if (memberStatus != null) result.memberStatus = memberStatus;
    if (avatar != null) result.avatar = avatar;
    if (lastReadMarker != null) result.lastReadMarker = lastReadMarker;
    return result;
  }

  RoomMemberDetail._();

  factory RoomMemberDetail.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RoomMemberDetail.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoomMemberDetail',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'ru.sputnikn.api.contract.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'fullName', protoName: 'fullName')
    ..aOB(3, _omitFieldNames ? '' : 'isOnline', protoName: 'isOnline')
    ..aE<RoomMemberStatusType>(4, _omitFieldNames ? '' : 'memberStatus',
        protoName: 'memberStatus', enumValues: RoomMemberStatusType.values)
    ..aOS(5, _omitFieldNames ? '' : 'avatar')
    ..aOM<$2.Timestamp>(6, _omitFieldNames ? '' : 'lastReadMarker',
        protoName: 'lastReadMarker', subBuilder: $2.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomMemberDetail clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomMemberDetail copyWith(void Function(RoomMemberDetail) updates) =>
      super.copyWith((message) => updates(message as RoomMemberDetail))
          as RoomMemberDetail;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomMemberDetail create() => RoomMemberDetail._();
  @$core.override
  RoomMemberDetail createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RoomMemberDetail getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomMemberDetail>(create);
  static RoomMemberDetail? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get fullName => $_getSZ(1);
  @$pb.TagNumber(2)
  set fullName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasFullName() => $_has(1);
  @$pb.TagNumber(2)
  void clearFullName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get isOnline => $_getBF(2);
  @$pb.TagNumber(3)
  set isOnline($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIsOnline() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsOnline() => $_clearField(3);

  @$pb.TagNumber(4)
  RoomMemberStatusType get memberStatus => $_getN(3);
  @$pb.TagNumber(4)
  set memberStatus(RoomMemberStatusType value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasMemberStatus() => $_has(3);
  @$pb.TagNumber(4)
  void clearMemberStatus() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get avatar => $_getSZ(4);
  @$pb.TagNumber(5)
  set avatar($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasAvatar() => $_has(4);
  @$pb.TagNumber(5)
  void clearAvatar() => $_clearField(5);

  @$pb.TagNumber(6)
  $2.Timestamp get lastReadMarker => $_getN(5);
  @$pb.TagNumber(6)
  set lastReadMarker($2.Timestamp value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasLastReadMarker() => $_has(5);
  @$pb.TagNumber(6)
  void clearLastReadMarker() => $_clearField(6);
  @$pb.TagNumber(6)
  $2.Timestamp ensureLastReadMarker() => $_ensure(5);
}

/// The RoomState, it will be sent to client every time Room is changed (title, avatar, members, member read markers)
class RoomDetail extends $pb.GeneratedMessage {
  factory RoomDetail({
    $core.String? roomId,
    $core.String? title,
    $core.String? avatar,
    $core.Iterable<RoomMemberDetail>? members,
    $core.int? eventMessageUnreadCount,
    $core.int? eventSystemUnreadCount,
  }) {
    final result = create();
    if (roomId != null) result.roomId = roomId;
    if (title != null) result.title = title;
    if (avatar != null) result.avatar = avatar;
    if (members != null) result.members.addAll(members);
    if (eventMessageUnreadCount != null)
      result.eventMessageUnreadCount = eventMessageUnreadCount;
    if (eventSystemUnreadCount != null)
      result.eventSystemUnreadCount = eventSystemUnreadCount;
    return result;
  }

  RoomDetail._();

  factory RoomDetail.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RoomDetail.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoomDetail',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'ru.sputnikn.api.contract.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'roomId', protoName: 'roomId')
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..aOS(3, _omitFieldNames ? '' : 'avatar')
    ..pPM<RoomMemberDetail>(4, _omitFieldNames ? '' : 'members',
        subBuilder: RoomMemberDetail.create)
    ..aI(5, _omitFieldNames ? '' : 'eventMessageUnreadCount',
        protoName: 'eventMessageUnreadCount')
    ..aI(6, _omitFieldNames ? '' : 'eventSystemUnreadCount',
        protoName: 'eventSystemUnreadCount')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomDetail clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomDetail copyWith(void Function(RoomDetail) updates) =>
      super.copyWith((message) => updates(message as RoomDetail)) as RoomDetail;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomDetail create() => RoomDetail._();
  @$core.override
  RoomDetail createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RoomDetail getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomDetail>(create);
  static RoomDetail? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get roomId => $_getSZ(0);
  @$pb.TagNumber(1)
  set roomId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get avatar => $_getSZ(2);
  @$pb.TagNumber(3)
  set avatar($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAvatar() => $_has(2);
  @$pb.TagNumber(3)
  void clearAvatar() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<RoomMemberDetail> get members => $_getList(3);

  @$pb.TagNumber(5)
  $core.int get eventMessageUnreadCount => $_getIZ(4);
  @$pb.TagNumber(5)
  set eventMessageUnreadCount($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasEventMessageUnreadCount() => $_has(4);
  @$pb.TagNumber(5)
  void clearEventMessageUnreadCount() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get eventSystemUnreadCount => $_getIZ(5);
  @$pb.TagNumber(6)
  set eventSystemUnreadCount($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasEventSystemUnreadCount() => $_has(5);
  @$pb.TagNumber(6)
  void clearEventSystemUnreadCount() => $_clearField(6);
}

class ListRoomsResponse extends $pb.GeneratedMessage {
  factory ListRoomsResponse({
    $core.Iterable<RoomDetail>? detail,
  }) {
    final result = create();
    if (detail != null) result.detail.addAll(detail);
    return result;
  }

  ListRoomsResponse._();

  factory ListRoomsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListRoomsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListRoomsResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'ru.sputnikn.api.contract.v1'),
      createEmptyInstance: create)
    ..pPM<RoomDetail>(1, _omitFieldNames ? '' : 'detail',
        subBuilder: RoomDetail.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListRoomsResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListRoomsResponse copyWith(void Function(ListRoomsResponse) updates) =>
      super.copyWith((message) => updates(message as ListRoomsResponse))
          as ListRoomsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListRoomsResponse create() => ListRoomsResponse._();
  @$core.override
  ListRoomsResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListRoomsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListRoomsResponse>(create);
  static ListRoomsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<RoomDetail> get detail => $_getList(0);
}

class SinceTimeFilter extends $pb.GeneratedMessage {
  factory SinceTimeFilter({
    $2.Timestamp? since,
    SinceTimeOrderType? orderType,
  }) {
    final result = create();
    if (since != null) result.since = since;
    if (orderType != null) result.orderType = orderType;
    return result;
  }

  SinceTimeFilter._();

  factory SinceTimeFilter.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SinceTimeFilter.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SinceTimeFilter',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'ru.sputnikn.api.contract.v1'),
      createEmptyInstance: create)
    ..aOM<$2.Timestamp>(1, _omitFieldNames ? '' : 'since',
        subBuilder: $2.Timestamp.create)
    ..aE<SinceTimeOrderType>(2, _omitFieldNames ? '' : 'orderType',
        protoName: 'orderType', enumValues: SinceTimeOrderType.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SinceTimeFilter clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SinceTimeFilter copyWith(void Function(SinceTimeFilter) updates) =>
      super.copyWith((message) => updates(message as SinceTimeFilter))
          as SinceTimeFilter;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SinceTimeFilter create() => SinceTimeFilter._();
  @$core.override
  SinceTimeFilter createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SinceTimeFilter getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SinceTimeFilter>(create);
  static SinceTimeFilter? _defaultInstance;

  @$pb.TagNumber(1)
  $2.Timestamp get since => $_getN(0);
  @$pb.TagNumber(1)
  set since($2.Timestamp value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasSince() => $_has(0);
  @$pb.TagNumber(1)
  void clearSince() => $_clearField(1);
  @$pb.TagNumber(1)
  $2.Timestamp ensureSince() => $_ensure(0);

  @$pb.TagNumber(2)
  SinceTimeOrderType get orderType => $_getN(1);
  @$pb.TagNumber(2)
  set orderType(SinceTimeOrderType value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasOrderType() => $_has(1);
  @$pb.TagNumber(2)
  void clearOrderType() => $_clearField(2);
}

class SyncRoomFilter extends $pb.GeneratedMessage {
  factory SyncRoomFilter({
    $core.String? roomId,
    SinceTimeFilter? sinceFilter,
    $core.int? eventLimit,
    RoomEventType? eventFilter,
  }) {
    final result = create();
    if (roomId != null) result.roomId = roomId;
    if (sinceFilter != null) result.sinceFilter = sinceFilter;
    if (eventLimit != null) result.eventLimit = eventLimit;
    if (eventFilter != null) result.eventFilter = eventFilter;
    return result;
  }

  SyncRoomFilter._();

  factory SyncRoomFilter.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SyncRoomFilter.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SyncRoomFilter',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'ru.sputnikn.api.contract.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'roomId', protoName: 'roomId')
    ..aOM<SinceTimeFilter>(2, _omitFieldNames ? '' : 'sinceFilter',
        protoName: 'sinceFilter', subBuilder: SinceTimeFilter.create)
    ..aI(3, _omitFieldNames ? '' : 'eventLimit', protoName: 'eventLimit')
    ..aE<RoomEventType>(4, _omitFieldNames ? '' : 'eventFilter',
        protoName: 'eventFilter', enumValues: RoomEventType.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SyncRoomFilter clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SyncRoomFilter copyWith(void Function(SyncRoomFilter) updates) =>
      super.copyWith((message) => updates(message as SyncRoomFilter))
          as SyncRoomFilter;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SyncRoomFilter create() => SyncRoomFilter._();
  @$core.override
  SyncRoomFilter createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SyncRoomFilter getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SyncRoomFilter>(create);
  static SyncRoomFilter? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get roomId => $_getSZ(0);
  @$pb.TagNumber(1)
  set roomId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => $_clearField(1);

  /// Mean we want to filter room events with offset of time and order direction
  @$pb.TagNumber(2)
  SinceTimeFilter get sinceFilter => $_getN(1);
  @$pb.TagNumber(2)
  set sinceFilter(SinceTimeFilter value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasSinceFilter() => $_has(1);
  @$pb.TagNumber(2)
  void clearSinceFilter() => $_clearField(2);
  @$pb.TagNumber(2)
  SinceTimeFilter ensureSinceFilter() => $_ensure(1);

  /// Mean we want to get limited room events with conjunction of sinceFilter and eventFilter
  @$pb.TagNumber(3)
  $core.int get eventLimit => $_getIZ(2);
  @$pb.TagNumber(3)
  set eventLimit($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasEventLimit() => $_has(2);
  @$pb.TagNumber(3)
  void clearEventLimit() => $_clearField(3);

  /// Mean we want to filter room events by type
  @$pb.TagNumber(4)
  RoomEventType get eventFilter => $_getN(3);
  @$pb.TagNumber(4)
  set eventFilter(RoomEventType value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasEventFilter() => $_has(3);
  @$pb.TagNumber(4)
  void clearEventFilter() => $_clearField(4);
}

class SyncRoomsRequest extends $pb.GeneratedMessage {
  factory SyncRoomsRequest({
    $core.Iterable<SyncRoomFilter>? roomFilter,
  }) {
    final result = create();
    if (roomFilter != null) result.roomFilter.addAll(roomFilter);
    return result;
  }

  SyncRoomsRequest._();

  factory SyncRoomsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SyncRoomsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SyncRoomsRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'ru.sputnikn.api.contract.v1'),
      createEmptyInstance: create)
    ..pPM<SyncRoomFilter>(1, _omitFieldNames ? '' : 'roomFilter',
        protoName: 'roomFilter', subBuilder: SyncRoomFilter.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SyncRoomsRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SyncRoomsRequest copyWith(void Function(SyncRoomsRequest) updates) =>
      super.copyWith((message) => updates(message as SyncRoomsRequest))
          as SyncRoomsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SyncRoomsRequest create() => SyncRoomsRequest._();
  @$core.override
  SyncRoomsRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SyncRoomsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SyncRoomsRequest>(create);
  static SyncRoomsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<SyncRoomFilter> get roomFilter => $_getList(0);
}

class ChatAttachmentDetail extends $pb.GeneratedMessage {
  factory ChatAttachmentDetail({
    $core.String? eventId,
    $core.String? attachmentId,
    $core.String? mimeType,
  }) {
    final result = create();
    if (eventId != null) result.eventId = eventId;
    if (attachmentId != null) result.attachmentId = attachmentId;
    if (mimeType != null) result.mimeType = mimeType;
    return result;
  }

  ChatAttachmentDetail._();

  factory ChatAttachmentDetail.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChatAttachmentDetail.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChatAttachmentDetail',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'ru.sputnikn.api.contract.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'eventId', protoName: 'eventId')
    ..aOS(2, _omitFieldNames ? '' : 'attachmentId', protoName: 'attachmentId')
    ..aOS(3, _omitFieldNames ? '' : 'mimeType', protoName: 'mimeType')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatAttachmentDetail clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatAttachmentDetail copyWith(void Function(ChatAttachmentDetail) updates) =>
      super.copyWith((message) => updates(message as ChatAttachmentDetail))
          as ChatAttachmentDetail;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatAttachmentDetail create() => ChatAttachmentDetail._();
  @$core.override
  ChatAttachmentDetail createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChatAttachmentDetail getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChatAttachmentDetail>(create);
  static ChatAttachmentDetail? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get eventId => $_getSZ(0);
  @$pb.TagNumber(1)
  set eventId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEventId() => $_has(0);
  @$pb.TagNumber(1)
  void clearEventId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get attachmentId => $_getSZ(1);
  @$pb.TagNumber(2)
  set attachmentId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAttachmentId() => $_has(1);
  @$pb.TagNumber(2)
  void clearAttachmentId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get mimeType => $_getSZ(2);
  @$pb.TagNumber(3)
  set mimeType($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasMimeType() => $_has(2);
  @$pb.TagNumber(3)
  void clearMimeType() => $_clearField(3);
}

class RoomEventReactionDetail extends $pb.GeneratedMessage {
  factory RoomEventReactionDetail({
    $core.String? eventId,
    $core.String? roomId,
    $core.String? senderId,
    $core.String? content,
    $2.Timestamp? createdAt,
  }) {
    final result = create();
    if (eventId != null) result.eventId = eventId;
    if (roomId != null) result.roomId = roomId;
    if (senderId != null) result.senderId = senderId;
    if (content != null) result.content = content;
    if (createdAt != null) result.createdAt = createdAt;
    return result;
  }

  RoomEventReactionDetail._();

  factory RoomEventReactionDetail.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RoomEventReactionDetail.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoomEventReactionDetail',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'ru.sputnikn.api.contract.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'eventId', protoName: 'eventId')
    ..aOS(2, _omitFieldNames ? '' : 'roomId', protoName: 'roomId')
    ..aOS(3, _omitFieldNames ? '' : 'senderId', protoName: 'senderId')
    ..aOS(4, _omitFieldNames ? '' : 'content')
    ..aOM<$2.Timestamp>(5, _omitFieldNames ? '' : 'createdAt',
        protoName: 'createdAt', subBuilder: $2.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomEventReactionDetail clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomEventReactionDetail copyWith(
          void Function(RoomEventReactionDetail) updates) =>
      super.copyWith((message) => updates(message as RoomEventReactionDetail))
          as RoomEventReactionDetail;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomEventReactionDetail create() => RoomEventReactionDetail._();
  @$core.override
  RoomEventReactionDetail createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RoomEventReactionDetail getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomEventReactionDetail>(create);
  static RoomEventReactionDetail? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get eventId => $_getSZ(0);
  @$pb.TagNumber(1)
  set eventId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEventId() => $_has(0);
  @$pb.TagNumber(1)
  void clearEventId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get roomId => $_getSZ(1);
  @$pb.TagNumber(2)
  set roomId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRoomId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoomId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get senderId => $_getSZ(2);
  @$pb.TagNumber(3)
  set senderId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSenderId() => $_has(2);
  @$pb.TagNumber(3)
  void clearSenderId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get content => $_getSZ(3);
  @$pb.TagNumber(4)
  set content($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasContent() => $_has(3);
  @$pb.TagNumber(4)
  void clearContent() => $_clearField(4);

  @$pb.TagNumber(5)
  $2.Timestamp get createdAt => $_getN(4);
  @$pb.TagNumber(5)
  set createdAt($2.Timestamp value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasCreatedAt() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreatedAt() => $_clearField(5);
  @$pb.TagNumber(5)
  $2.Timestamp ensureCreatedAt() => $_ensure(4);
}

class RoomEventMessageDetail extends $pb.GeneratedMessage {
  factory RoomEventMessageDetail({
    $core.String? eventId,
    $core.String? roomId,
    $core.String? senderId,
    $core.int? version,
    $core.Iterable<ChatAttachmentDetail>? attachment,
    $core.Iterable<RoomEventReactionDetail>? reaction,
    $core.String? content,
    $2.Timestamp? createdAt,
    $2.Timestamp? updatedAt,
  }) {
    final result = create();
    if (eventId != null) result.eventId = eventId;
    if (roomId != null) result.roomId = roomId;
    if (senderId != null) result.senderId = senderId;
    if (version != null) result.version = version;
    if (attachment != null) result.attachment.addAll(attachment);
    if (reaction != null) result.reaction.addAll(reaction);
    if (content != null) result.content = content;
    if (createdAt != null) result.createdAt = createdAt;
    if (updatedAt != null) result.updatedAt = updatedAt;
    return result;
  }

  RoomEventMessageDetail._();

  factory RoomEventMessageDetail.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RoomEventMessageDetail.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoomEventMessageDetail',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'ru.sputnikn.api.contract.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'eventId', protoName: 'eventId')
    ..aOS(2, _omitFieldNames ? '' : 'roomId', protoName: 'roomId')
    ..aOS(3, _omitFieldNames ? '' : 'senderId', protoName: 'senderId')
    ..aI(4, _omitFieldNames ? '' : 'version')
    ..pPM<ChatAttachmentDetail>(5, _omitFieldNames ? '' : 'attachment',
        subBuilder: ChatAttachmentDetail.create)
    ..pPM<RoomEventReactionDetail>(6, _omitFieldNames ? '' : 'reaction',
        subBuilder: RoomEventReactionDetail.create)
    ..aOS(7, _omitFieldNames ? '' : 'content')
    ..aOM<$2.Timestamp>(8, _omitFieldNames ? '' : 'createdAt',
        protoName: 'createdAt', subBuilder: $2.Timestamp.create)
    ..aOM<$2.Timestamp>(9, _omitFieldNames ? '' : 'updatedAt',
        protoName: 'updatedAt', subBuilder: $2.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomEventMessageDetail clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomEventMessageDetail copyWith(
          void Function(RoomEventMessageDetail) updates) =>
      super.copyWith((message) => updates(message as RoomEventMessageDetail))
          as RoomEventMessageDetail;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomEventMessageDetail create() => RoomEventMessageDetail._();
  @$core.override
  RoomEventMessageDetail createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RoomEventMessageDetail getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomEventMessageDetail>(create);
  static RoomEventMessageDetail? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get eventId => $_getSZ(0);
  @$pb.TagNumber(1)
  set eventId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEventId() => $_has(0);
  @$pb.TagNumber(1)
  void clearEventId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get roomId => $_getSZ(1);
  @$pb.TagNumber(2)
  set roomId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRoomId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoomId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get senderId => $_getSZ(2);
  @$pb.TagNumber(3)
  set senderId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSenderId() => $_has(2);
  @$pb.TagNumber(3)
  void clearSenderId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get version => $_getIZ(3);
  @$pb.TagNumber(4)
  set version($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasVersion() => $_has(3);
  @$pb.TagNumber(4)
  void clearVersion() => $_clearField(4);

  @$pb.TagNumber(5)
  $pb.PbList<ChatAttachmentDetail> get attachment => $_getList(4);

  @$pb.TagNumber(6)
  $pb.PbList<RoomEventReactionDetail> get reaction => $_getList(5);

  @$pb.TagNumber(7)
  $core.String get content => $_getSZ(6);
  @$pb.TagNumber(7)
  set content($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasContent() => $_has(6);
  @$pb.TagNumber(7)
  void clearContent() => $_clearField(7);

  @$pb.TagNumber(8)
  $2.Timestamp get createdAt => $_getN(7);
  @$pb.TagNumber(8)
  set createdAt($2.Timestamp value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasCreatedAt() => $_has(7);
  @$pb.TagNumber(8)
  void clearCreatedAt() => $_clearField(8);
  @$pb.TagNumber(8)
  $2.Timestamp ensureCreatedAt() => $_ensure(7);

  @$pb.TagNumber(9)
  $2.Timestamp get updatedAt => $_getN(8);
  @$pb.TagNumber(9)
  set updatedAt($2.Timestamp value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasUpdatedAt() => $_has(8);
  @$pb.TagNumber(9)
  void clearUpdatedAt() => $_clearField(9);
  @$pb.TagNumber(9)
  $2.Timestamp ensureUpdatedAt() => $_ensure(8);
}

class RoomEventSystemDetail extends $pb.GeneratedMessage {
  factory RoomEventSystemDetail({
    $core.String? eventId,
    $core.String? roomId,
    $core.int? version,
    $core.String? content,
    $2.Timestamp? createdAt,
  }) {
    final result = create();
    if (eventId != null) result.eventId = eventId;
    if (roomId != null) result.roomId = roomId;
    if (version != null) result.version = version;
    if (content != null) result.content = content;
    if (createdAt != null) result.createdAt = createdAt;
    return result;
  }

  RoomEventSystemDetail._();

  factory RoomEventSystemDetail.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RoomEventSystemDetail.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoomEventSystemDetail',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'ru.sputnikn.api.contract.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'eventId', protoName: 'eventId')
    ..aOS(2, _omitFieldNames ? '' : 'roomId', protoName: 'roomId')
    ..aI(3, _omitFieldNames ? '' : 'version')
    ..aOS(4, _omitFieldNames ? '' : 'content')
    ..aOM<$2.Timestamp>(5, _omitFieldNames ? '' : 'createdAt',
        protoName: 'createdAt', subBuilder: $2.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomEventSystemDetail clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomEventSystemDetail copyWith(
          void Function(RoomEventSystemDetail) updates) =>
      super.copyWith((message) => updates(message as RoomEventSystemDetail))
          as RoomEventSystemDetail;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomEventSystemDetail create() => RoomEventSystemDetail._();
  @$core.override
  RoomEventSystemDetail createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RoomEventSystemDetail getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomEventSystemDetail>(create);
  static RoomEventSystemDetail? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get eventId => $_getSZ(0);
  @$pb.TagNumber(1)
  set eventId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEventId() => $_has(0);
  @$pb.TagNumber(1)
  void clearEventId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get roomId => $_getSZ(1);
  @$pb.TagNumber(2)
  set roomId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRoomId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoomId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get version => $_getIZ(2);
  @$pb.TagNumber(3)
  set version($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasVersion() => $_has(2);
  @$pb.TagNumber(3)
  void clearVersion() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get content => $_getSZ(3);
  @$pb.TagNumber(4)
  set content($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasContent() => $_has(3);
  @$pb.TagNumber(4)
  void clearContent() => $_clearField(4);

  @$pb.TagNumber(5)
  $2.Timestamp get createdAt => $_getN(4);
  @$pb.TagNumber(5)
  set createdAt($2.Timestamp value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasCreatedAt() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreatedAt() => $_clearField(5);
  @$pb.TagNumber(5)
  $2.Timestamp ensureCreatedAt() => $_ensure(4);
}

class SyncRoomsResponse extends $pb.GeneratedMessage {
  factory SyncRoomsResponse({
    $core.Iterable<RoomEventMessageDetail>? messageEvents,
    $core.Iterable<RoomEventSystemDetail>? systemEvents,
  }) {
    final result = create();
    if (messageEvents != null) result.messageEvents.addAll(messageEvents);
    if (systemEvents != null) result.systemEvents.addAll(systemEvents);
    return result;
  }

  SyncRoomsResponse._();

  factory SyncRoomsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SyncRoomsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SyncRoomsResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'ru.sputnikn.api.contract.v1'),
      createEmptyInstance: create)
    ..pPM<RoomEventMessageDetail>(1, _omitFieldNames ? '' : 'messageEvents',
        protoName: 'messageEvents', subBuilder: RoomEventMessageDetail.create)
    ..pPM<RoomEventSystemDetail>(2, _omitFieldNames ? '' : 'systemEvents',
        protoName: 'systemEvents', subBuilder: RoomEventSystemDetail.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SyncRoomsResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SyncRoomsResponse copyWith(void Function(SyncRoomsResponse) updates) =>
      super.copyWith((message) => updates(message as SyncRoomsResponse))
          as SyncRoomsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SyncRoomsResponse create() => SyncRoomsResponse._();
  @$core.override
  SyncRoomsResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SyncRoomsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SyncRoomsResponse>(create);
  static SyncRoomsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<RoomEventMessageDetail> get messageEvents => $_getList(0);

  @$pb.TagNumber(2)
  $pb.PbList<RoomEventSystemDetail> get systemEvents => $_getList(1);
}

class RoomEventMessageRequest extends $pb.GeneratedMessage {
  factory RoomEventMessageRequest({
    $core.String? roomId,
    $core.Iterable<$core.String>? attachment,
    $core.String? content,
    $core.int? version,
  }) {
    final result = create();
    if (roomId != null) result.roomId = roomId;
    if (attachment != null) result.attachment.addAll(attachment);
    if (content != null) result.content = content;
    if (version != null) result.version = version;
    return result;
  }

  RoomEventMessageRequest._();

  factory RoomEventMessageRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RoomEventMessageRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoomEventMessageRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'ru.sputnikn.api.contract.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'roomId', protoName: 'roomId')
    ..pPS(2, _omitFieldNames ? '' : 'attachment')
    ..aOS(3, _omitFieldNames ? '' : 'content')
    ..aI(4, _omitFieldNames ? '' : 'version')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomEventMessageRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomEventMessageRequest copyWith(
          void Function(RoomEventMessageRequest) updates) =>
      super.copyWith((message) => updates(message as RoomEventMessageRequest))
          as RoomEventMessageRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomEventMessageRequest create() => RoomEventMessageRequest._();
  @$core.override
  RoomEventMessageRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RoomEventMessageRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomEventMessageRequest>(create);
  static RoomEventMessageRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get roomId => $_getSZ(0);
  @$pb.TagNumber(1)
  set roomId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<$core.String> get attachment => $_getList(1);

  @$pb.TagNumber(3)
  $core.String get content => $_getSZ(2);
  @$pb.TagNumber(3)
  set content($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasContent() => $_has(2);
  @$pb.TagNumber(3)
  void clearContent() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get version => $_getIZ(3);
  @$pb.TagNumber(4)
  set version($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasVersion() => $_has(3);
  @$pb.TagNumber(4)
  void clearVersion() => $_clearField(4);
}

class RoomEventMessageResponse extends $pb.GeneratedMessage {
  factory RoomEventMessageResponse({
    RoomEventMessageDetail? detail,
  }) {
    final result = create();
    if (detail != null) result.detail = detail;
    return result;
  }

  RoomEventMessageResponse._();

  factory RoomEventMessageResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RoomEventMessageResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoomEventMessageResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'ru.sputnikn.api.contract.v1'),
      createEmptyInstance: create)
    ..aOM<RoomEventMessageDetail>(1, _omitFieldNames ? '' : 'detail',
        subBuilder: RoomEventMessageDetail.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomEventMessageResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomEventMessageResponse copyWith(
          void Function(RoomEventMessageResponse) updates) =>
      super.copyWith((message) => updates(message as RoomEventMessageResponse))
          as RoomEventMessageResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomEventMessageResponse create() => RoomEventMessageResponse._();
  @$core.override
  RoomEventMessageResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RoomEventMessageResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomEventMessageResponse>(create);
  static RoomEventMessageResponse? _defaultInstance;

  @$pb.TagNumber(1)
  RoomEventMessageDetail get detail => $_getN(0);
  @$pb.TagNumber(1)
  set detail(RoomEventMessageDetail value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasDetail() => $_has(0);
  @$pb.TagNumber(1)
  void clearDetail() => $_clearField(1);
  @$pb.TagNumber(1)
  RoomEventMessageDetail ensureDetail() => $_ensure(0);
}

class RoomEventMessageReactionRequest extends $pb.GeneratedMessage {
  factory RoomEventMessageReactionRequest({
    $core.String? roomId,
    $core.String? messageId,
    $core.int? clientEventId,
    $core.String? content,
    $core.int? version,
  }) {
    final result = create();
    if (roomId != null) result.roomId = roomId;
    if (messageId != null) result.messageId = messageId;
    if (clientEventId != null) result.clientEventId = clientEventId;
    if (content != null) result.content = content;
    if (version != null) result.version = version;
    return result;
  }

  RoomEventMessageReactionRequest._();

  factory RoomEventMessageReactionRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RoomEventMessageReactionRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoomEventMessageReactionRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'ru.sputnikn.api.contract.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'roomId', protoName: 'roomId')
    ..aOS(2, _omitFieldNames ? '' : 'messageId', protoName: 'messageId')
    ..aI(3, _omitFieldNames ? '' : 'clientEventId', protoName: 'clientEventId')
    ..aOS(4, _omitFieldNames ? '' : 'content')
    ..aI(5, _omitFieldNames ? '' : 'version')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomEventMessageReactionRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomEventMessageReactionRequest copyWith(
          void Function(RoomEventMessageReactionRequest) updates) =>
      super.copyWith(
              (message) => updates(message as RoomEventMessageReactionRequest))
          as RoomEventMessageReactionRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomEventMessageReactionRequest create() =>
      RoomEventMessageReactionRequest._();
  @$core.override
  RoomEventMessageReactionRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RoomEventMessageReactionRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomEventMessageReactionRequest>(
          create);
  static RoomEventMessageReactionRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get roomId => $_getSZ(0);
  @$pb.TagNumber(1)
  set roomId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get messageId => $_getSZ(1);
  @$pb.TagNumber(2)
  set messageId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessageId() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessageId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get clientEventId => $_getIZ(2);
  @$pb.TagNumber(3)
  set clientEventId($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasClientEventId() => $_has(2);
  @$pb.TagNumber(3)
  void clearClientEventId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get content => $_getSZ(3);
  @$pb.TagNumber(4)
  set content($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasContent() => $_has(3);
  @$pb.TagNumber(4)
  void clearContent() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get version => $_getIZ(4);
  @$pb.TagNumber(5)
  set version($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasVersion() => $_has(4);
  @$pb.TagNumber(5)
  void clearVersion() => $_clearField(5);
}

class RoomEventMessageReactionResponse extends $pb.GeneratedMessage {
  factory RoomEventMessageReactionResponse({
    RoomEventReactionDetail? detail,
  }) {
    final result = create();
    if (detail != null) result.detail = detail;
    return result;
  }

  RoomEventMessageReactionResponse._();

  factory RoomEventMessageReactionResponse.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RoomEventMessageReactionResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoomEventMessageReactionResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'ru.sputnikn.api.contract.v1'),
      createEmptyInstance: create)
    ..aOM<RoomEventReactionDetail>(1, _omitFieldNames ? '' : 'detail',
        subBuilder: RoomEventReactionDetail.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomEventMessageReactionResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomEventMessageReactionResponse copyWith(
          void Function(RoomEventMessageReactionResponse) updates) =>
      super.copyWith(
              (message) => updates(message as RoomEventMessageReactionResponse))
          as RoomEventMessageReactionResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomEventMessageReactionResponse create() =>
      RoomEventMessageReactionResponse._();
  @$core.override
  RoomEventMessageReactionResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RoomEventMessageReactionResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomEventMessageReactionResponse>(
          create);
  static RoomEventMessageReactionResponse? _defaultInstance;

  @$pb.TagNumber(1)
  RoomEventReactionDetail get detail => $_getN(0);
  @$pb.TagNumber(1)
  set detail(RoomEventReactionDetail value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasDetail() => $_has(0);
  @$pb.TagNumber(1)
  void clearDetail() => $_clearField(1);
  @$pb.TagNumber(1)
  RoomEventReactionDetail ensureDetail() => $_ensure(0);
}

class ListUsersRequest extends $pb.GeneratedMessage {
  factory ListUsersRequest() => create();

  ListUsersRequest._();

  factory ListUsersRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListUsersRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListUsersRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'ru.sputnikn.api.contract.v1'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListUsersRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListUsersRequest copyWith(void Function(ListUsersRequest) updates) =>
      super.copyWith((message) => updates(message as ListUsersRequest))
          as ListUsersRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListUsersRequest create() => ListUsersRequest._();
  @$core.override
  ListUsersRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListUsersRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListUsersRequest>(create);
  static ListUsersRequest? _defaultInstance;
}

class ListUsersResponse extends $pb.GeneratedMessage {
  factory ListUsersResponse({
    $core.Iterable<UserDetail>? users,
  }) {
    final result = create();
    if (users != null) result.users.addAll(users);
    return result;
  }

  ListUsersResponse._();

  factory ListUsersResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListUsersResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListUsersResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'ru.sputnikn.api.contract.v1'),
      createEmptyInstance: create)
    ..pPM<UserDetail>(1, _omitFieldNames ? '' : 'users',
        subBuilder: UserDetail.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListUsersResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListUsersResponse copyWith(void Function(ListUsersResponse) updates) =>
      super.copyWith((message) => updates(message as ListUsersResponse))
          as ListUsersResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListUsersResponse create() => ListUsersResponse._();
  @$core.override
  ListUsersResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListUsersResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListUsersResponse>(create);
  static ListUsersResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<UserDetail> get users => $_getList(0);
}

/// Will produce RoomStateChangedReply
class RoomReadMarkerRequest extends $pb.GeneratedMessage {
  factory RoomReadMarkerRequest({
    $core.String? roomId,
    $2.Timestamp? readMarker,
  }) {
    final result = create();
    if (roomId != null) result.roomId = roomId;
    if (readMarker != null) result.readMarker = readMarker;
    return result;
  }

  RoomReadMarkerRequest._();

  factory RoomReadMarkerRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RoomReadMarkerRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoomReadMarkerRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'ru.sputnikn.api.contract.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'roomId', protoName: 'roomId')
    ..aOM<$2.Timestamp>(2, _omitFieldNames ? '' : 'readMarker',
        protoName: 'readMarker', subBuilder: $2.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomReadMarkerRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomReadMarkerRequest copyWith(
          void Function(RoomReadMarkerRequest) updates) =>
      super.copyWith((message) => updates(message as RoomReadMarkerRequest))
          as RoomReadMarkerRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomReadMarkerRequest create() => RoomReadMarkerRequest._();
  @$core.override
  RoomReadMarkerRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RoomReadMarkerRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomReadMarkerRequest>(create);
  static RoomReadMarkerRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get roomId => $_getSZ(0);
  @$pb.TagNumber(1)
  set roomId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => $_clearField(1);

  @$pb.TagNumber(2)
  $2.Timestamp get readMarker => $_getN(1);
  @$pb.TagNumber(2)
  set readMarker($2.Timestamp value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasReadMarker() => $_has(1);
  @$pb.TagNumber(2)
  void clearReadMarker() => $_clearField(2);
  @$pb.TagNumber(2)
  $2.Timestamp ensureReadMarker() => $_ensure(1);
}

class CreateRoomRequest extends $pb.GeneratedMessage {
  factory CreateRoomRequest({
    $core.String? title,
    $core.String? avatar,
    $core.Iterable<$core.String>? memberIds,
  }) {
    final result = create();
    if (title != null) result.title = title;
    if (avatar != null) result.avatar = avatar;
    if (memberIds != null) result.memberIds.addAll(memberIds);
    return result;
  }

  CreateRoomRequest._();

  factory CreateRoomRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateRoomRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateRoomRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'ru.sputnikn.api.contract.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'title')
    ..aOS(2, _omitFieldNames ? '' : 'avatar')
    ..pPS(3, _omitFieldNames ? '' : 'memberIds', protoName: 'memberIds')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateRoomRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateRoomRequest copyWith(void Function(CreateRoomRequest) updates) =>
      super.copyWith((message) => updates(message as CreateRoomRequest))
          as CreateRoomRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateRoomRequest create() => CreateRoomRequest._();
  @$core.override
  CreateRoomRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreateRoomRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateRoomRequest>(create);
  static CreateRoomRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get avatar => $_getSZ(1);
  @$pb.TagNumber(2)
  set avatar($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAvatar() => $_has(1);
  @$pb.TagNumber(2)
  void clearAvatar() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<$core.String> get memberIds => $_getList(2);
}

class CreateRoomResponse extends $pb.GeneratedMessage {
  factory CreateRoomResponse({
    RoomDetail? detail,
  }) {
    final result = create();
    if (detail != null) result.detail = detail;
    return result;
  }

  CreateRoomResponse._();

  factory CreateRoomResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateRoomResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateRoomResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'ru.sputnikn.api.contract.v1'),
      createEmptyInstance: create)
    ..aOM<RoomDetail>(1, _omitFieldNames ? '' : 'detail',
        subBuilder: RoomDetail.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateRoomResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateRoomResponse copyWith(void Function(CreateRoomResponse) updates) =>
      super.copyWith((message) => updates(message as CreateRoomResponse))
          as CreateRoomResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateRoomResponse create() => CreateRoomResponse._();
  @$core.override
  CreateRoomResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreateRoomResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateRoomResponse>(create);
  static CreateRoomResponse? _defaultInstance;

  @$pb.TagNumber(1)
  RoomDetail get detail => $_getN(0);
  @$pb.TagNumber(1)
  set detail(RoomDetail value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasDetail() => $_has(0);
  @$pb.TagNumber(1)
  void clearDetail() => $_clearField(1);
  @$pb.TagNumber(1)
  RoomDetail ensureDetail() => $_ensure(0);
}

/// Will produce RoomStateChangedResponse
class InviteRoomMemberRequest extends $pb.GeneratedMessage {
  factory InviteRoomMemberRequest({
    $core.String? roomId,
    $core.Iterable<$core.String>? memberIds,
  }) {
    final result = create();
    if (roomId != null) result.roomId = roomId;
    if (memberIds != null) result.memberIds.addAll(memberIds);
    return result;
  }

  InviteRoomMemberRequest._();

  factory InviteRoomMemberRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InviteRoomMemberRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InviteRoomMemberRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'ru.sputnikn.api.contract.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'roomId', protoName: 'roomId')
    ..pPS(2, _omitFieldNames ? '' : 'memberIds', protoName: 'memberIds')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InviteRoomMemberRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InviteRoomMemberRequest copyWith(
          void Function(InviteRoomMemberRequest) updates) =>
      super.copyWith((message) => updates(message as InviteRoomMemberRequest))
          as InviteRoomMemberRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InviteRoomMemberRequest create() => InviteRoomMemberRequest._();
  @$core.override
  InviteRoomMemberRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static InviteRoomMemberRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InviteRoomMemberRequest>(create);
  static InviteRoomMemberRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get roomId => $_getSZ(0);
  @$pb.TagNumber(1)
  set roomId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<$core.String> get memberIds => $_getList(1);
}

/// Will produce RoomStateChangedResponse
class RemoveRoomMemberRequest extends $pb.GeneratedMessage {
  factory RemoveRoomMemberRequest({
    $core.String? roomId,
    $core.Iterable<$core.String>? memberIds,
  }) {
    final result = create();
    if (roomId != null) result.roomId = roomId;
    if (memberIds != null) result.memberIds.addAll(memberIds);
    return result;
  }

  RemoveRoomMemberRequest._();

  factory RemoveRoomMemberRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RemoveRoomMemberRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RemoveRoomMemberRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'ru.sputnikn.api.contract.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'roomId', protoName: 'roomId')
    ..pPS(2, _omitFieldNames ? '' : 'memberIds', protoName: 'memberIds')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoveRoomMemberRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoveRoomMemberRequest copyWith(
          void Function(RemoveRoomMemberRequest) updates) =>
      super.copyWith((message) => updates(message as RemoveRoomMemberRequest))
          as RemoveRoomMemberRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoveRoomMemberRequest create() => RemoveRoomMemberRequest._();
  @$core.override
  RemoveRoomMemberRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RemoveRoomMemberRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RemoveRoomMemberRequest>(create);
  static RemoveRoomMemberRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get roomId => $_getSZ(0);
  @$pb.TagNumber(1)
  set roomId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<$core.String> get memberIds => $_getList(1);
}

class RoomStateChangedResponse extends $pb.GeneratedMessage {
  factory RoomStateChangedResponse({
    RoomDetail? detail,
  }) {
    final result = create();
    if (detail != null) result.detail = detail;
    return result;
  }

  RoomStateChangedResponse._();

  factory RoomStateChangedResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RoomStateChangedResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoomStateChangedResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'ru.sputnikn.api.contract.v1'),
      createEmptyInstance: create)
    ..aOM<RoomDetail>(1, _omitFieldNames ? '' : 'detail',
        subBuilder: RoomDetail.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomStateChangedResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomStateChangedResponse copyWith(
          void Function(RoomStateChangedResponse) updates) =>
      super.copyWith((message) => updates(message as RoomStateChangedResponse))
          as RoomStateChangedResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomStateChangedResponse create() => RoomStateChangedResponse._();
  @$core.override
  RoomStateChangedResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RoomStateChangedResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomStateChangedResponse>(create);
  static RoomStateChangedResponse? _defaultInstance;

  @$pb.TagNumber(1)
  RoomDetail get detail => $_getN(0);
  @$pb.TagNumber(1)
  set detail(RoomDetail value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasDetail() => $_has(0);
  @$pb.TagNumber(1)
  void clearDetail() => $_clearField(1);
  @$pb.TagNumber(1)
  RoomDetail ensureDetail() => $_ensure(0);
}

enum RoomEventResponse_Payload {
  messageEvent,
  systemEvent,
  roomStateChanged,
  messageEventReaction,
  notSet
}

class RoomEventResponse extends $pb.GeneratedMessage {
  factory RoomEventResponse({
    RoomEventMessageDetail? messageEvent,
    RoomEventSystemDetail? systemEvent,
    RoomDetail? roomStateChanged,
    RoomEventReactionDetail? messageEventReaction,
  }) {
    final result = create();
    if (messageEvent != null) result.messageEvent = messageEvent;
    if (systemEvent != null) result.systemEvent = systemEvent;
    if (roomStateChanged != null) result.roomStateChanged = roomStateChanged;
    if (messageEventReaction != null)
      result.messageEventReaction = messageEventReaction;
    return result;
  }

  RoomEventResponse._();

  factory RoomEventResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RoomEventResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, RoomEventResponse_Payload>
      _RoomEventResponse_PayloadByTag = {
    1: RoomEventResponse_Payload.messageEvent,
    2: RoomEventResponse_Payload.systemEvent,
    3: RoomEventResponse_Payload.roomStateChanged,
    5: RoomEventResponse_Payload.messageEventReaction,
    0: RoomEventResponse_Payload.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoomEventResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'ru.sputnikn.api.contract.v1'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 5])
    ..aOM<RoomEventMessageDetail>(1, _omitFieldNames ? '' : 'messageEvent',
        protoName: 'messageEvent', subBuilder: RoomEventMessageDetail.create)
    ..aOM<RoomEventSystemDetail>(2, _omitFieldNames ? '' : 'systemEvent',
        protoName: 'systemEvent', subBuilder: RoomEventSystemDetail.create)
    ..aOM<RoomDetail>(3, _omitFieldNames ? '' : 'roomStateChanged',
        protoName: 'roomStateChanged', subBuilder: RoomDetail.create)
    ..aOM<RoomEventReactionDetail>(
        5, _omitFieldNames ? '' : 'messageEventReaction',
        protoName: 'messageEventReaction',
        subBuilder: RoomEventReactionDetail.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomEventResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomEventResponse copyWith(void Function(RoomEventResponse) updates) =>
      super.copyWith((message) => updates(message as RoomEventResponse))
          as RoomEventResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomEventResponse create() => RoomEventResponse._();
  @$core.override
  RoomEventResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RoomEventResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomEventResponse>(create);
  static RoomEventResponse? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(5)
  RoomEventResponse_Payload whichPayload() =>
      _RoomEventResponse_PayloadByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(5)
  void clearPayload() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  RoomEventMessageDetail get messageEvent => $_getN(0);
  @$pb.TagNumber(1)
  set messageEvent(RoomEventMessageDetail value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasMessageEvent() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessageEvent() => $_clearField(1);
  @$pb.TagNumber(1)
  RoomEventMessageDetail ensureMessageEvent() => $_ensure(0);

  @$pb.TagNumber(2)
  RoomEventSystemDetail get systemEvent => $_getN(1);
  @$pb.TagNumber(2)
  set systemEvent(RoomEventSystemDetail value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasSystemEvent() => $_has(1);
  @$pb.TagNumber(2)
  void clearSystemEvent() => $_clearField(2);
  @$pb.TagNumber(2)
  RoomEventSystemDetail ensureSystemEvent() => $_ensure(1);

  @$pb.TagNumber(3)
  RoomDetail get roomStateChanged => $_getN(2);
  @$pb.TagNumber(3)
  set roomStateChanged(RoomDetail value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasRoomStateChanged() => $_has(2);
  @$pb.TagNumber(3)
  void clearRoomStateChanged() => $_clearField(3);
  @$pb.TagNumber(3)
  RoomDetail ensureRoomStateChanged() => $_ensure(2);

  @$pb.TagNumber(5)
  RoomEventReactionDetail get messageEventReaction => $_getN(3);
  @$pb.TagNumber(5)
  set messageEventReaction(RoomEventReactionDetail value) =>
      $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasMessageEventReaction() => $_has(3);
  @$pb.TagNumber(5)
  void clearMessageEventReaction() => $_clearField(5);
  @$pb.TagNumber(5)
  RoomEventReactionDetail ensureMessageEventReaction() => $_ensure(3);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
