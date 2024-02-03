import 'package:flutter/foundation.dart';
import '../models/task.dart';

class TaskProvider with ChangeNotifier {
  final List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  // Add New Task :
  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  // Delete / Completed Tasks :
  void deleteTask(Task task){
    _tasks.remove(task);
    notifyListeners();
  }
}