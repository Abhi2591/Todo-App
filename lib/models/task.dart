class Task {
  final String id;
  final String taskTitle;
  late bool isTaskDone;

  Task({
    required this.id,
    required this.taskTitle,
    required this.isTaskDone,
  });
}