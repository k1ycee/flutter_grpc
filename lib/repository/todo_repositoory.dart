import 'package:flutter_grpc/grpc_files/proto/todo.pbgrpc.dart';
import 'package:flutter_grpc/services/todo_grpc_client_service.dart';

class TodoRepository {
  TodoRepository._internal();

  static final TodoRepository _instance = TodoRepository._internal();

  factory TodoRepository() => _instance;
  static TodoRepository get instance => _instance;

  Future<TodoList> fetchTodos() async {
    Empty empty = Empty();
    var todos = await TodoService.instance.todoServiceClient.getAllTodos(empty);
    return todos;
  }

  Future<TodoList> createTodo({String? title, String? whatTodo}) async {
    Todo todo = Todo();
    todo.id = DateTime.now().microsecondsSinceEpoch.toString();
    todo.title = title!;
    todo.todo = whatTodo!;
    var todos = await TodoService.instance.todoServiceClient.addTodo(todo);
    return todos;
  }

  Future<TodoList> deleteTodo(String todoId) async {
    TodoId todo = TodoId();
    todo.id = todoId;
    var todos = await TodoService.instance.todoServiceClient.deleteTodo(todo);
    return todos;
  }

  Future<Todo> getTodo(String todoId) async {
    TodoId todo = TodoId();
    todo.id = todoId;
    var singleTodo = await TodoService.instance.todoServiceClient.getTodo(todo);
    return singleTodo;
  }

  Future<Todo> editTodo(
      {String? todoId, String? title, String? whatTodo}) async {
    Todo todo = Todo();
    todo.id = todoId!;
    todo.title = title!;
    todo.todo = whatTodo!;
    var editedTodo =
        await TodoService.instance.todoServiceClient.editTodo(todo);
    return editedTodo;
  }
}
