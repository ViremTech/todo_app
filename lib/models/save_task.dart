import 'package:flutter/material.dart';
import 'package:todo_app/models/task_model.dart';

class SaveTask extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(
      title: 'Learn Flutter',
      isCompleted: false,
    ),
    Task(title: 'Drink Water', isCompleted: false)
  ];

  List<Task> get tasks => _tasks;

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void checkTask(int index) {
    tasks[index].isDone();
    notifyListeners();
  }

  void removeTask(Task task) {
    tasks.remove(task);
    notifyListeners();
  }
}
