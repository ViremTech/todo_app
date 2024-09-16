import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/save_task.dart';
import 'package:todo_app/pages/add_todo.dart';
import 'package:todo_app/pages/todo_list.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => SaveTask(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const TodoList(),
        '/add_todo_screen': (context) => AddTodo(),
      },
    );
  }
}
