import 'package:flutter/material.dart';
import 'package:flutter_grpc/view_model/todo_vm.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flutter_grpc/grpc_files/proto/todo.pbgrpc.dart';
import 'package:flutter_grpc/widgets/button_style.dart';
import 'package:flutter_grpc/widgets/custom_button.dart';
import 'package:flutter_grpc/widgets/custom_textfield.dart';

class TodoForm extends StatefulWidget {
  const TodoForm({
    Key? key,
    this.todo,
    this.isEditing = false,
  }) : super(key: key);

  final bool isEditing;
  final Todo? todo;

  @override
  State<TodoForm> createState() => _TodoFormState();
}

class _TodoFormState extends State<TodoForm> {
  final titleController = TextEditingController();
  final todoController = TextEditingController();

  @override
  void initState() {
    if (widget.isEditing) {
      titleController.text = widget.todo!.title;
      todoController.text = widget.todo!.todo;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (_, ref, __) {
      return widget.isEditing
          ? Scaffold(
              body: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: CustomTextField(
                      title: 'Todo Title',
                      controller: titleController,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: CustomTextField(
                      title: 'Todo',
                      controller: todoController,
                    ),
                  ),
                  const Spacer(),
                  CustomButton(
                    buttonText: 'Update Todo',
                    textColor: Colors.white,
                    buttonStyle: buttonStyle(color: Colors.black),
                    onPressed: () {
                      ref.read(todoVM).editTodo(
                            title: titleController.text,
                            whatTodo: todoController.text,
                            todoId: widget.todo!.id,
                          );
                      ref.read(todoVM).getTodo(widget.todo!.id);
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                ],
              ),
            )
          : Scaffold(
              body: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: CustomTextField(
                      title: 'Todo Title',
                      controller: titleController,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: CustomTextField(
                      title: 'Todo',
                      controller: todoController,
                    ),
                  ),
                  const Spacer(),
                  CustomButton(
                    buttonText: 'Add Todo',
                    textColor: Colors.white,
                    buttonStyle: buttonStyle(color: Colors.black),
                    onPressed: () {
                      ref.read(todoVM).createTodos(
                            title: titleController.text,
                            whatTodo: todoController.text,
                          );
                      ref.read(todoVM).getAllTodos();
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                ],
              ),
            );
    });
  }
}
