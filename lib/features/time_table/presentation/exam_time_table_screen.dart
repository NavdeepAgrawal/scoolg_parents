
import 'package:flutter/material.dart';

class ExamTimeTableScreen extends StatelessWidget {
  const ExamTimeTableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final exams = [
      "Math — 10 Feb",
      "Science — 12 Feb",
      "English — 15 Feb",
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Exam Timetable")),
      body: ListView(
        children: exams
            .map((e) => ListTile(
          leading: const Icon(Icons.edit_note),
          title: Text(e),
        ))
            .toList(),
      ),
    );
  }
}