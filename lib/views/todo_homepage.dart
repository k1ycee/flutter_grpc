import 'package:flutter/material.dart';
import 'package:flutter_grpc/view_model/todo_vm.dart';
import 'package:flutter_grpc/views/todo_form.dart';
import 'package:flutter_grpc/views/view_single_todo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TodoHomePage extends ConsumerWidget {
  const TodoHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoList = ref.watch(todoVM.select((it) => it.todoList.todo));
    final isLoading = ref.watch(todoVM.select((it) => it.loading));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Grpc Todo App',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: todoList.isEmpty
          ? const Center(
              child: Text(
                "You've finished all your todos, Chief 👍!",
              ),
            )
          : isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: todoList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(todoList[index].title),
                      subtitle: Text(todoList[index].todo),
                      onTap: () {
                        ref.read(todoVM).getTodo(todoList[index].id);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SingleTodoPage(),
                          ),
                        );
                      },
                    );
                  },
                ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return const SizedBox(
                height: 400,
                width: double.infinity,
                child: TodoForm(),
              );
            },
          );
        },
        tooltip: 'Add todo',
        child: const Icon(Icons.add),
      ),
    );
  }
}
