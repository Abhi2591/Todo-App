import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String title;
  final bool isDone;
  final void Function(bool?)? onChanged;
  final void Function()? onPressed;

  const TaskTile({super.key,
    required this.title,
    required this.isDone,
    this.onChanged,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        title: Text(title),
        leading: Checkbox(
          value: isDone,
          onChanged: onChanged,
        ),
        trailing: isDone == true
            ?
        IconButton(
            onPressed: onPressed,
            icon: Icon(Icons.delete,color: Colors.red,)
        )
            :
        const SizedBox(),
      ),
    );
  }
}