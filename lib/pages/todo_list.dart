import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/save_task.dart';
import 'package:todo_app/models/task_model.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        centerTitle: true,
      ),
      body: Consumer<SaveTask>(
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: value.tasks.length,
            itemBuilder: (BuildContext context, index) {
              return ListTile(
                title: Text(
                  value.tasks[index].title,
                  style: TextStyle(
                    decoration: value.tasks[index].isCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
                trailing: Wrap(
                  children: [
                    Checkbox(
                      value: value.tasks[index].isCompleted,
                      onChanged: (value) {
                        context.read<SaveTask>().checkTask(index);
                      },
                    ),
                    IconButton(
                      onPressed: () {
                        context.read<SaveTask>().removeTask(
                              value.tasks[index],
                            );
                      },
                      icon: const Icon(
                        Icons.delete,
                      ),
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add_todo_screen');
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
