import 'package:flutter/material.dart';
import 'package:flutter_grpc/view_model/todo_vm.dart';
import 'package:flutter_grpc/views/todo_form.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SingleTodoPage extends ConsumerWidget {
  const SingleTodoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todo = ref.watch(todoVM.select((it) => it.todo));
    final isLoading = ref.watch(todoVM.select((it) => it.loading));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Todo',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListTile(
              title: Text(todo.title),
              subtitle: Text(todo.todo),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  ref.read(todoVM).deleteTodo(todo.id);
                  ref.read(todoVM).getAllTodos();
                  Navigator.pop(context);
                },
              ),
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return  SizedBox(
                height: 400,
                width: double.infinity,
                child: TodoForm(
                  isEditing: true,
                  todo: todo,
                ),
              );
            },
          );
        },
        tooltip: 'Edit todo',
        child: const Icon(Icons.edit),
      ),
    );
  }
}
