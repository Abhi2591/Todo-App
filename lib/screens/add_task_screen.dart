import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/constants/Color_Constants.dart';

import '../models/task.dart';
import '../providers/task_provider.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {

  final TextEditingController _taskController = TextEditingController();

  void _addTask(BuildContext context) {
    final taskText = _taskController.text;
    if (taskText.isNotEmpty) {
      Provider.of<TaskProvider>(context, listen: false).addTask(
        Task(
          id: DateTime.now().toString(),
          taskTitle: taskText,
          isTaskDone: false,
        ),
      );
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors_Constants.app_bg,
      appBar: AppBar(
        backgroundColor: Colors_Constants.primary.shade200,
        title: const Text('Add Task Screen',style: TextStyle(fontWeight: FontWeight.w600),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _taskController,
              decoration: const InputDecoration(labelText: 'Task'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors_Constants.btnColor
              ),
              onPressed: () => _addTask(context),
              child: const Text('Add Task',style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}
