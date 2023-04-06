import 'package:flutter/material.dart';
import 'package:flutter_grpc/services/todo_grpc_client_service.dart';
import 'package:flutter_grpc/views/todo_homepage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stack_trace/stack_trace.dart' as stack_trace;

void main()  {
  WidgetsFlutterBinding.ensureInitialized();
  /// Solves the special error case if you encounter one
  /// STARTS HERE
  FlutterError.demangleStackTrace = (StackTrace stack) {
  if (stack is stack_trace.Trace) return stack.vmTrace;
  if (stack is stack_trace.Chain) return stack.toTrace().vmTrace;
  return stack;
};
/// ENDS HERE
  TodoService().init();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TodoHomePage(),
    );
  }
}

