import "package:flutter/material.dart";
import "package:flutter_todo_auth/store/tasks.dart";
import "package:flutter_todo_auth/widgets/modals/edit_task.dart";
import "package:flutter_todo_auth/widgets/tasks/tile.dart";
import "package:provider/provider.dart";

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Tasks>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
              taskTitle: task.name,
              isChecked: task.isDone,
              checkboxCallback: (checkboxState) {
                taskData.updateTask(task);
              },
              editPressCallback: () {
                showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => SingleChildScrollView(
                        child:Container(
                          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: EditTask(title: task.name),
                        )
                    )
                );
              },
              longPressCallback: () {
                taskData.deleteTask(task);
              }
            );
          },
          itemCount: taskData.taskCount
        );
      }
    );
  }
}