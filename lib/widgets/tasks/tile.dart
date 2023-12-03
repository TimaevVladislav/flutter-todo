import "package:flutter/material.dart";

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final checkboxCallback;
  final longPressCallback;
  final editPressCallback;

  TaskTile({required this.isChecked, required this.taskTitle, required this.checkboxCallback, required this.longPressCallback, required this.editPressCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: editPressCallback,
      onLongPress: longPressCallback,
      title: Text(
        taskTitle,
        style: TextStyle(decoration: isChecked ? TextDecoration.lineThrough : null)),
      trailing: Checkbox(
        value: isChecked,
        onChanged: checkboxCallback,
        activeColor: Colors.lightBlueAccent,
      )
    );
  }
}