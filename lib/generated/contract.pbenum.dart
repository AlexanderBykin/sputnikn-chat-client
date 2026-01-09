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

class AuthErrorType extends $pb.ProtobufEnum {
  static const AuthErrorType AuthErrorTypeNone =
      AuthErrorType._(0, _omitEnumNames ? '' : 'AuthErrorTypeNone');
  static const AuthErrorType AuthErrorTypeUserWrongCreds =
      AuthErrorType._(1, _omitEnumNames ? '' : 'AuthErrorTypeUserWrongCreds');

  static const $core.List<AuthErrorType> values = <AuthErrorType>[
    AuthErrorTypeNone,
    AuthErrorTypeUserWrongCreds,
  ];

  static final $core.List<AuthErrorType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static AuthErrorType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const AuthErrorType._(super.value, super.name);
}

class RoomMemberStatusType extends $pb.ProtobufEnum {
  static const RoomMemberStatusType RoomMemberStatusTypeInvited =
      RoomMemberStatusType._(
          0, _omitEnumNames ? '' : 'RoomMemberStatusTypeInvited');
  static const RoomMemberStatusType RoomMemberStatusTypeJoined =
      RoomMemberStatusType._(
          1, _omitEnumNames ? '' : 'RoomMemberStatusTypeJoined');
  static const RoomMemberStatusType RoomMemberStatusTypeLeft =
      RoomMemberStatusType._(
          2, _omitEnumNames ? '' : 'RoomMemberStatusTypeLeft');
  static const RoomMemberStatusType RoomMemberStatusTypeKicked =
      RoomMemberStatusType._(
          3, _omitEnumNames ? '' : 'RoomMemberStatusTypeKicked');
  static const RoomMemberStatusType RoomMemberStatusTypeBanned =
      RoomMemberStatusType._(
          4, _omitEnumNames ? '' : 'RoomMemberStatusTypeBanned');

  static const $core.List<RoomMemberStatusType> values = <RoomMemberStatusType>[
    RoomMemberStatusTypeInvited,
    RoomMemberStatusTypeJoined,
    RoomMemberStatusTypeLeft,
    RoomMemberStatusTypeKicked,
    RoomMemberStatusTypeBanned,
  ];

  static final $core.List<RoomMemberStatusType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 4);
  static RoomMemberStatusType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const RoomMemberStatusType._(super.value, super.name);
}

class RoomEventType extends $pb.ProtobufEnum {
  static const RoomEventType roomEventTypeAll =
      RoomEventType._(0, _omitEnumNames ? '' : 'roomEventTypeAll');
  static const RoomEventType roomEventTypeMessage =
      RoomEventType._(1, _omitEnumNames ? '' : 'roomEventTypeMessage');
  static const RoomEventType roomEventTypeSystem =
      RoomEventType._(2, _omitEnumNames ? '' : 'roomEventTypeSystem');

  static const $core.List<RoomEventType> values = <RoomEventType>[
    roomEventTypeAll,
    roomEventTypeMessage,
    roomEventTypeSystem,
  ];

  static final $core.List<RoomEventType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static RoomEventType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const RoomEventType._(super.value, super.name);
}

class SinceTimeOrderType extends $pb.ProtobufEnum {
  static const SinceTimeOrderType sinceTimeOrderTypeNewest =
      SinceTimeOrderType._(0, _omitEnumNames ? '' : 'sinceTimeOrderTypeNewest');
  static const SinceTimeOrderType sinceTimeOrderTypeOldest =
      SinceTimeOrderType._(1, _omitEnumNames ? '' : 'sinceTimeOrderTypeOldest');

  static const $core.List<SinceTimeOrderType> values = <SinceTimeOrderType>[
    sinceTimeOrderTypeNewest,
    sinceTimeOrderTypeOldest,
  ];

  static final $core.List<SinceTimeOrderType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static SinceTimeOrderType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const SinceTimeOrderType._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
