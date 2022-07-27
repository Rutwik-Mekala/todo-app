import 'package:flutter/foundation.dart';
import 'package:quickbuck/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> taskList = [];

  void addNewTask(newString) {
    final task = Task(name: newString);
    taskList.add(task);
    notifyListeners();
  }

  int get listLength => taskList.length;

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    taskList.remove(task);
    notifyListeners();
  }
}
