import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/constants/Color_Constants.dart';
import 'package:get/get.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/providers/task_provider.dart';
import 'package:todo_app/screens/add_task_screen.dart';

import '../components/task_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late bool? isDone;

  @override
  Widget build(BuildContext context) {

    final tasks = Provider.of<TaskProvider>(context).tasks;

    return Scaffold(
      backgroundColor: Colors_Constants.app_bg,
      appBar: AppBar(
        backgroundColor: Colors_Constants.primary.shade200,
        title: const Text('Todo List',style: TextStyle(fontWeight: FontWeight.w600),),
        centerTitle: true,
        actions: [

          const SizedBox(width: 15,)
        ],
      ),
      body: tasks.isEmpty
          ?
      const Center(
        child: Text('No Task is Pending...'),
      )
          :
      ListView.separated(
          itemBuilder: (context, index) {
            final task = tasks[index];
            return TaskTile(
              title: task.taskTitle,
              isDone: task.isTaskDone,
              onChanged: (value) {
                setState(() {
                  task.isTaskDone = !task.isTaskDone;
                });
                // Implement task completion logic
              },
              onPressed: () {
                context.read<TaskProvider>().deleteTask(task);
              },
            );
          },
        itemCount: tasks.length ?? 0,
        separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 10,);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(()=> const AddTaskScreen(),
              transition: Transition.downToUp,
              curve: Curves.fastOutSlowIn,
              duration: const Duration(milliseconds: 500)
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
