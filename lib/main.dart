import 'package:flutter/material.dart';
import 'package:todo_app/views/screens/homepage_screen.dart';

void main() {
  runApp(Todo());
}

class Todo extends StatelessWidget {
  const Todo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}
