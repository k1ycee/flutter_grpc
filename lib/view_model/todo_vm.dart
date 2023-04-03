import 'package:flutter_grpc/view_model/base_vm.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_grpc/grpc_files/proto/todo.pbgrpc.dart';

final mealViewModelProvider = ChangeNotifierProvider(
  (_) => TodoViewModel(),
);

class TodoViewModel extends BaseViewModel {
  TodoList? _todoList;

  TodoList get todoList => _todoList!;

  set todoList(TodoList val) {
    _todoList = val;
    notifyListeners();
  }

  Todo? _todo;

  Todo get todo => _todo!;

  set todo(Todo val) {
    _todo = val;
    notifyListeners();
  }

  Future<void> getAllTodos() async {
    final todos = await todoRepositoryInstance.fetchTodos();
    todoList = todos;
  }

  Future<void> createTodos({String? title, String? whatTodo}) async {
    await todoRepositoryInstance.createTodo(title: title, whatTodo: whatTodo);
  }

  Future<void> deleteTodo(String todoId) async {
    await todoRepositoryInstance.deleteTodo(todoId);
  }

  Future<void> deleteTodos(String todoId) async {
    await todoRepositoryInstance.deleteTodo(todoId);
  }

  Future<void> getTodo(String todoId) async {
    final res = await todoRepositoryInstance.getTodo(todoId);
    todo = res;
  }

  Future<void> editTodo(
      {String? todoId, String? title, String? whatTodo}) async {
    await todoRepositoryInstance.editTodo(
        todoId: todoId, title: title, whatTodo: whatTodo);
  }
}
