import 'package:flutter/material.dart';

class HomeworkScreen extends StatelessWidget {
  const HomeworkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homework = [
      "Math: Exercise 5",
      "Science: Chapter 3 Notes",
      "English: Essay Writing",
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Homework & Assignments")),
      body: ListView(
        children: homework
            .map((e) => ListTile(
          leading: const Icon(Icons.assignment),
          title: Text(e),
        ))
            .toList(),
      ),
    );
  }
}