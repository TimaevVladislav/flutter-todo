import "package:flutter/foundation.dart";
import "package:flutter_todo_auth/models/task.dart";
import "dart:collection";

class Tasks extends ChangeNotifier {
  List<Task> tasks = [];

  UnmodifiableListView<Task> get _tasks {
    return UnmodifiableListView(tasks);
  }

  int get taskCount {
    return tasks.length;
  }

  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void editTask(String oldTitle, String newTitle) {
    final index = tasks.indexWhere((task) => task.name == oldTitle);
    if (index != -1) {
      tasks[index].name = newTitle;
      notifyListeners();
    }
  }

  void deleteTask(Task task) {
    tasks.remove(task);
    notifyListeners();
  }
}