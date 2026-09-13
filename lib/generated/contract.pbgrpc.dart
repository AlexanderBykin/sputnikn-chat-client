// This is a generated file - do not edit.
//
// Generated from contract.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;
import 'package:protobuf/well_known_types/google/protobuf/empty.pb.dart' as $1;

import 'contract.pb.dart' as $0;

export 'contract.pb.dart';

@$pb.GrpcServiceName('ru.sputnikn.api.contract.v1.ChatService')
class ChatServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  ChatServiceClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.AuthUserResponse> authUser(
    $0.AuthUserRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$authUser, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListRoomsResponse> listRooms(
    $0.ListRoomsRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listRooms, request, options: options);
  }

  $grpc.ResponseFuture<$0.SyncRoomsResponse> syncRooms(
    $0.SyncRoomsRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$syncRooms, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListUsersResponse> listUsers(
    $0.ListUsersRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listUsers, request, options: options);
  }

  $grpc.ResponseFuture<$0.RoomStateChangedResponse> setRoomReadMarker(
    $0.RoomReadMarkerRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$setRoomReadMarker, request, options: options);
  }

  $grpc.ResponseFuture<$0.CreateRoomResponse> createRoom(
    $0.CreateRoomRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$createRoom, request, options: options);
  }

  $grpc.ResponseFuture<$0.RoomStateChangedResponse> inviteRoomMember(
    $0.InviteRoomMemberRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$inviteRoomMember, request, options: options);
  }

  $grpc.ResponseFuture<$0.RoomStateChangedResponse> removeRoomMember(
    $0.RemoveRoomMemberRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$removeRoomMember, request, options: options);
  }

  $grpc.ResponseFuture<$0.RoomEventMessageResponse> addRoomMessage(
    $0.RoomEventMessageRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$addRoomMessage, request, options: options);
  }

  $grpc.ResponseFuture<$0.RoomEventMessageReactionResponse>
      addRoomMessageReaction(
    $0.RoomEventMessageReactionRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$addRoomMessageReaction, request,
        options: options);
  }

  $grpc.ResponseStream<$0.RoomEventResponse> subscribeRoomEvents(
    $1.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createStreamingCall(
        _$subscribeRoomEvents, $async.Stream.fromIterable([request]),
        options: options);
  }

  // method descriptors

  static final _$authUser =
      $grpc.ClientMethod<$0.AuthUserRequest, $0.AuthUserResponse>(
          '/ru.sputnikn.api.contract.v1.ChatService/AuthUser',
          ($0.AuthUserRequest value) => value.writeToBuffer(),
          $0.AuthUserResponse.fromBuffer);
  static final _$listRooms =
      $grpc.ClientMethod<$0.ListRoomsRequest, $0.ListRoomsResponse>(
          '/ru.sputnikn.api.contract.v1.ChatService/ListRooms',
          ($0.ListRoomsRequest value) => value.writeToBuffer(),
          $0.ListRoomsResponse.fromBuffer);
  static final _$syncRooms =
      $grpc.ClientMethod<$0.SyncRoomsRequest, $0.SyncRoomsResponse>(
          '/ru.sputnikn.api.contract.v1.ChatService/SyncRooms',
          ($0.SyncRoomsRequest value) => value.writeToBuffer(),
          $0.SyncRoomsResponse.fromBuffer);
  static final _$listUsers =
      $grpc.ClientMethod<$0.ListUsersRequest, $0.ListUsersResponse>(
          '/ru.sputnikn.api.contract.v1.ChatService/ListUsers',
          ($0.ListUsersRequest value) => value.writeToBuffer(),
          $0.ListUsersResponse.fromBuffer);
  static final _$setRoomReadMarker =
      $grpc.ClientMethod<$0.RoomReadMarkerRequest, $0.RoomStateChangedResponse>(
          '/ru.sputnikn.api.contract.v1.ChatService/SetRoomReadMarker',
          ($0.RoomReadMarkerRequest value) => value.writeToBuffer(),
          $0.RoomStateChangedResponse.fromBuffer);
  static final _$createRoom =
      $grpc.ClientMethod<$0.CreateRoomRequest, $0.CreateRoomResponse>(
          '/ru.sputnikn.api.contract.v1.ChatService/CreateRoom',
          ($0.CreateRoomRequest value) => value.writeToBuffer(),
          $0.CreateRoomResponse.fromBuffer);
  static final _$inviteRoomMember = $grpc.ClientMethod<
          $0.InviteRoomMemberRequest, $0.RoomStateChangedResponse>(
      '/ru.sputnikn.api.contract.v1.ChatService/InviteRoomMember',
      ($0.InviteRoomMemberRequest value) => value.writeToBuffer(),
      $0.RoomStateChangedResponse.fromBuffer);
  static final _$removeRoomMember = $grpc.ClientMethod<
          $0.RemoveRoomMemberRequest, $0.RoomStateChangedResponse>(
      '/ru.sputnikn.api.contract.v1.ChatService/RemoveRoomMember',
      ($0.RemoveRoomMemberRequest value) => value.writeToBuffer(),
      $0.RoomStateChangedResponse.fromBuffer);
  static final _$addRoomMessage = $grpc.ClientMethod<$0.RoomEventMessageRequest,
          $0.RoomEventMessageResponse>(
      '/ru.sputnikn.api.contract.v1.ChatService/AddRoomMessage',
      ($0.RoomEventMessageRequest value) => value.writeToBuffer(),
      $0.RoomEventMessageResponse.fromBuffer);
  static final _$addRoomMessageReaction = $grpc.ClientMethod<
          $0.RoomEventMessageReactionRequest,
          $0.RoomEventMessageReactionResponse>(
      '/ru.sputnikn.api.contract.v1.ChatService/AddRoomMessageReaction',
      ($0.RoomEventMessageReactionRequest value) => value.writeToBuffer(),
      $0.RoomEventMessageReactionResponse.fromBuffer);
  static final _$subscribeRoomEvents =
      $grpc.ClientMethod<$1.Empty, $0.RoomEventResponse>(
          '/ru.sputnikn.api.contract.v1.ChatService/SubscribeRoomEvents',
          ($1.Empty value) => value.writeToBuffer(),
          $0.RoomEventResponse.fromBuffer);
}

@$pb.GrpcServiceName('ru.sputnikn.api.contract.v1.ChatService')
abstract class ChatServiceBase extends $grpc.Service {
  $core.String get $name => 'ru.sputnikn.api.contract.v1.ChatService';

  ChatServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.AuthUserRequest, $0.AuthUserResponse>(
        'AuthUser',
        authUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AuthUserRequest.fromBuffer(value),
        ($0.AuthUserResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListRoomsRequest, $0.ListRoomsResponse>(
        'ListRooms',
        listRooms_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ListRoomsRequest.fromBuffer(value),
        ($0.ListRoomsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SyncRoomsRequest, $0.SyncRoomsResponse>(
        'SyncRooms',
        syncRooms_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SyncRoomsRequest.fromBuffer(value),
        ($0.SyncRoomsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListUsersRequest, $0.ListUsersResponse>(
        'ListUsers',
        listUsers_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ListUsersRequest.fromBuffer(value),
        ($0.ListUsersResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RoomReadMarkerRequest,
            $0.RoomStateChangedResponse>(
        'SetRoomReadMarker',
        setRoomReadMarker_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.RoomReadMarkerRequest.fromBuffer(value),
        ($0.RoomStateChangedResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateRoomRequest, $0.CreateRoomResponse>(
        'CreateRoom',
        createRoom_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateRoomRequest.fromBuffer(value),
        ($0.CreateRoomResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.InviteRoomMemberRequest,
            $0.RoomStateChangedResponse>(
        'InviteRoomMember',
        inviteRoomMember_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.InviteRoomMemberRequest.fromBuffer(value),
        ($0.RoomStateChangedResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RemoveRoomMemberRequest,
            $0.RoomStateChangedResponse>(
        'RemoveRoomMember',
        removeRoomMember_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.RemoveRoomMemberRequest.fromBuffer(value),
        ($0.RoomStateChangedResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RoomEventMessageRequest,
            $0.RoomEventMessageResponse>(
        'AddRoomMessage',
        addRoomMessage_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.RoomEventMessageRequest.fromBuffer(value),
        ($0.RoomEventMessageResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RoomEventMessageReactionRequest,
            $0.RoomEventMessageReactionResponse>(
        'AddRoomMessageReaction',
        addRoomMessageReaction_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.RoomEventMessageReactionRequest.fromBuffer(value),
        ($0.RoomEventMessageReactionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.RoomEventResponse>(
        'SubscribeRoomEvents',
        subscribeRoomEvents_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.RoomEventResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.AuthUserResponse> authUser_Pre($grpc.ServiceCall $call,
      $async.Future<$0.AuthUserRequest> $request) async {
    return authUser($call, await $request);
  }

  $async.Future<$0.AuthUserResponse> authUser(
      $grpc.ServiceCall call, $0.AuthUserRequest request);

  $async.Future<$0.ListRoomsResponse> listRooms_Pre($grpc.ServiceCall $call,
      $async.Future<$0.ListRoomsRequest> $request) async {
    return listRooms($call, await $request);
  }

  $async.Future<$0.ListRoomsResponse> listRooms(
      $grpc.ServiceCall call, $0.ListRoomsRequest request);

  $async.Future<$0.SyncRoomsResponse> syncRooms_Pre($grpc.ServiceCall $call,
      $async.Future<$0.SyncRoomsRequest> $request) async {
    return syncRooms($call, await $request);
  }

  $async.Future<$0.SyncRoomsResponse> syncRooms(
      $grpc.ServiceCall call, $0.SyncRoomsRequest request);

  $async.Future<$0.ListUsersResponse> listUsers_Pre($grpc.ServiceCall $call,
      $async.Future<$0.ListUsersRequest> $request) async {
    return listUsers($call, await $request);
  }

  $async.Future<$0.ListUsersResponse> listUsers(
      $grpc.ServiceCall call, $0.ListUsersRequest request);

  $async.Future<$0.RoomStateChangedResponse> setRoomReadMarker_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.RoomReadMarkerRequest> $request) async {
    return setRoomReadMarker($call, await $request);
  }

  $async.Future<$0.RoomStateChangedResponse> setRoomReadMarker(
      $grpc.ServiceCall call, $0.RoomReadMarkerRequest request);

  $async.Future<$0.CreateRoomResponse> createRoom_Pre($grpc.ServiceCall $call,
      $async.Future<$0.CreateRoomRequest> $request) async {
    return createRoom($call, await $request);
  }

  $async.Future<$0.CreateRoomResponse> createRoom(
      $grpc.ServiceCall call, $0.CreateRoomRequest request);

  $async.Future<$0.RoomStateChangedResponse> inviteRoomMember_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.InviteRoomMemberRequest> $request) async {
    return inviteRoomMember($call, await $request);
  }

  $async.Future<$0.RoomStateChangedResponse> inviteRoomMember(
      $grpc.ServiceCall call, $0.InviteRoomMemberRequest request);

  $async.Future<$0.RoomStateChangedResponse> removeRoomMember_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.RemoveRoomMemberRequest> $request) async {
    return removeRoomMember($call, await $request);
  }

  $async.Future<$0.RoomStateChangedResponse> removeRoomMember(
      $grpc.ServiceCall call, $0.RemoveRoomMemberRequest request);

  $async.Future<$0.RoomEventMessageResponse> addRoomMessage_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.RoomEventMessageRequest> $request) async {
    return addRoomMessage($call, await $request);
  }

  $async.Future<$0.RoomEventMessageResponse> addRoomMessage(
      $grpc.ServiceCall call, $0.RoomEventMessageRequest request);

  $async.Future<$0.RoomEventMessageReactionResponse> addRoomMessageReaction_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.RoomEventMessageReactionRequest> $request) async {
    return addRoomMessageReaction($call, await $request);
  }

  $async.Future<$0.RoomEventMessageReactionResponse> addRoomMessageReaction(
      $grpc.ServiceCall call, $0.RoomEventMessageReactionRequest request);

  $async.Stream<$0.RoomEventResponse> subscribeRoomEvents_Pre(
      $grpc.ServiceCall $call, $async.Future<$1.Empty> $request) async* {
    yield* subscribeRoomEvents($call, await $request);
  }

  $async.Stream<$0.RoomEventResponse> subscribeRoomEvents(
      $grpc.ServiceCall call, $1.Empty request);
}
