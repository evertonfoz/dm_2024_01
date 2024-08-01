import 'package:flutter/material.dart';

import '../model/task_model.dart';
import 'task_tile.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;
  final Function(Task) toggleTaskCompletion;
  final Function(Task) deleteTask;

  const TaskList({
    super.key,
    required this.tasks,
    required this.toggleTaskCompletion,
    required this.deleteTask,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final task = tasks[index];
        return TaskTile(
          key: UniqueKey(),
          taskTitle: task.name,
          isChecked: task.isCompleted,
          checkboxCallback: (checkboxState) {
            toggleTaskCompletion(task);
          },
          longPressCallback: () {
            deleteTask(task);
          },
        );
      },
      itemCount: tasks.length,
    );
  }
}
