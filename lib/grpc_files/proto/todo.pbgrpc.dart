///
//  Generated code. Do not modify.
//  source: proto/todo.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'todo.pb.dart' as $0;
export 'todo.pb.dart';

class TodoServiceClient extends $grpc.Client {
  static final _$getAllTodos = $grpc.ClientMethod<$0.Empty, $0.TodoList>(
      '/TodoService/GetAllTodos',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.TodoList.fromBuffer(value));
  static final _$addTodo = $grpc.ClientMethod<$0.Todo, $0.TodoList>(
      '/TodoService/AddTodo',
      ($0.Todo value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.TodoList.fromBuffer(value));
  static final _$deleteTodo = $grpc.ClientMethod<$0.TodoId, $0.TodoList>(
      '/TodoService/DeleteTodo',
      ($0.TodoId value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.TodoList.fromBuffer(value));
  static final _$getTodo = $grpc.ClientMethod<$0.TodoId, $0.Todo>(
      '/TodoService/GetTodo',
      ($0.TodoId value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Todo.fromBuffer(value));
  static final _$editTodo = $grpc.ClientMethod<$0.Todo, $0.Todo>(
      '/TodoService/EditTodo',
      ($0.Todo value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Todo.fromBuffer(value));

  TodoServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.TodoList> getAllTodos($0.Empty request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getAllTodos, request, options: options);
  }

  $grpc.ResponseFuture<$0.TodoList> addTodo($0.Todo request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addTodo, request, options: options);
  }

  $grpc.ResponseFuture<$0.TodoList> deleteTodo($0.TodoId request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteTodo, request, options: options);
  }

  $grpc.ResponseFuture<$0.Todo> getTodo($0.TodoId request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getTodo, request, options: options);
  }

  $grpc.ResponseFuture<$0.Todo> editTodo($0.Todo request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$editTodo, request, options: options);
  }
}

abstract class TodoServiceBase extends $grpc.Service {
  $core.String get $name => 'TodoService';

  TodoServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.TodoList>(
        'GetAllTodos',
        getAllTodos_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.TodoList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Todo, $0.TodoList>(
        'AddTodo',
        addTodo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Todo.fromBuffer(value),
        ($0.TodoList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.TodoId, $0.TodoList>(
        'DeleteTodo',
        deleteTodo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.TodoId.fromBuffer(value),
        ($0.TodoList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.TodoId, $0.Todo>(
        'GetTodo',
        getTodo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.TodoId.fromBuffer(value),
        ($0.Todo value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Todo, $0.Todo>(
        'EditTodo',
        editTodo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Todo.fromBuffer(value),
        ($0.Todo value) => value.writeToBuffer()));
  }

  $async.Future<$0.TodoList> getAllTodos_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return getAllTodos(call, await request);
  }

  $async.Future<$0.TodoList> addTodo_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Todo> request) async {
    return addTodo(call, await request);
  }

  $async.Future<$0.TodoList> deleteTodo_Pre(
      $grpc.ServiceCall call, $async.Future<$0.TodoId> request) async {
    return deleteTodo(call, await request);
  }

  $async.Future<$0.Todo> getTodo_Pre(
      $grpc.ServiceCall call, $async.Future<$0.TodoId> request) async {
    return getTodo(call, await request);
  }

  $async.Future<$0.Todo> editTodo_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Todo> request) async {
    return editTodo(call, await request);
  }

  $async.Future<$0.TodoList> getAllTodos(
      $grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.TodoList> addTodo($grpc.ServiceCall call, $0.Todo request);
  $async.Future<$0.TodoList> deleteTodo(
      $grpc.ServiceCall call, $0.TodoId request);
  $async.Future<$0.Todo> getTodo($grpc.ServiceCall call, $0.TodoId request);
  $async.Future<$0.Todo> editTodo($grpc.ServiceCall call, $0.Todo request);
}
