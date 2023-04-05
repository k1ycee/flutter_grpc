import 'package:flutter_grpc/view_model/base_vm.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_grpc/grpc_files/proto/todo.pbgrpc.dart';

final todoVM = ChangeNotifierProvider(
  (_) => TodoViewModel(),
);

class TodoViewModel extends BaseViewModel {
  TodoViewModel() {
    getAllTodos();
  }
  TodoList _todoList = TodoList();

  TodoList get todoList => _todoList;

  set todoList(TodoList val) {
    _todoList = val;
    notifyListeners();
  }

  Todo _todo = Todo();

  Todo get todo => _todo;

  set todo(Todo val) {
    _todo = val;
    notifyListeners();
  }

  void getAllTodos() async {
    toggleLoading(true);
    final todos = await todoRepositoryInstance.fetchTodos();
    todoList = todos;
    toggleLoading(false);
  }

  Future<void> createTodos({String? title, String? whatTodo}) async {
    toggleLoading(true);
    await todoRepositoryInstance.createTodo(title: title, whatTodo: whatTodo);
    toggleLoading(false);
  }

  Future<void> deleteTodo(String todoId) async {
    toggleLoading(true);
    await todoRepositoryInstance.deleteTodo(todoId);
    toggleLoading(false);
  }

  Future<void> getTodo(String todoId) async {
    toggleLoading(true);
    final res = await todoRepositoryInstance.getTodo(todoId);
    todo = res;
    toggleLoading(false);
  }

  Future<void> editTodo(
      {String? todoId, String? title, String? whatTodo}) async {
    toggleLoading(true);
    await todoRepositoryInstance.editTodo(
        todoId: todoId, title: title, whatTodo: whatTodo);
    toggleLoading(false);
  }
}
