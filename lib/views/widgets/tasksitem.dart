import 'package:flutter/material.dart';
import 'package:todo_app/controllers/todocontrolers.dart';

import 'package:todo_app/models/tasks.dart';

// ignore: must_be_immutable
class Tasksitem extends StatefulWidget {
  final Tasks task;
  int index;
  Function(int) onDelete;
  Tasksitem({required this.task, required this.index, required this.onDelete});
  @override
  State<Tasksitem> createState() => _TasksitemState();
}

class _TasksitemState extends State<Tasksitem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
          onChanged: (value) {
            widget.task.ischechked = value!;
            widget.onDelete(widget.index);
          },
          value: widget.task.ischechked),
      title: Text(
        widget.task.title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        widget.task.subtitle,
      ),
    );
  }
}

//  widget.onDelete(widget.index);