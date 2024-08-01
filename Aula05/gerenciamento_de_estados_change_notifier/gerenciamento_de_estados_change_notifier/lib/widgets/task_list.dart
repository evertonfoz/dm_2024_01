import 'package:flutter/material.dart';
import 'package:gerenciamento_de_estados_change_notifier/state_manager/task_data.dart';
import 'package:provider/provider.dart';

import 'task_tile.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return ListView.builder(
        itemBuilder: (context, index) {
          final task = taskData.tasks[index];
          return TaskTile(
            key: UniqueKey(),
            taskTitle: task.name,
            isChecked: task.isCompleted,
            checkboxCallback: (checkboxState) {
              taskData.updateTask(task);
            },
            longPressCallback: () {
              taskData.deleteTask(task);
            },
          );
        },
        itemCount: taskData.taskCount,
      );
    });
  }
}
