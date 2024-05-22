import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:todo_app/controllers/todocontrolers.dart';
import 'package:todo_app/views/widgets/contact_add.dart';
import 'package:todo_app/views/widgets/tasksitem.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool? ischecked = true;
  final controller = Todocontrolers();
  onDelete(int index) {
    controller.remove(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            Map? data = await showDialog(
              context: context,
              builder: (ctx) {
                return ContactAdd();
              },
            );
            if (data != null) {
              controller.add(data['task'], data['date']);
              setState(() {});
            }
          },
          child: const Icon(Icons.add),
        ),
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xFF0172AF), Color(0xFF74FEBD)],
                  begin: Alignment.topRight,
                  end: Alignment.bottomRight)),
          child: ListView.builder(
              itemCount: controller.list.length,
              itemBuilder: (ctx, index) {
                return Tasksitem(
                  task: controller.list[index],
                  index: index,
                  onDelete: onDelete,
                );
              }),
        ));
  }
}
