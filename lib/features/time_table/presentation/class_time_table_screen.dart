
import 'package:flutter/material.dart';

class ClassTimeTableScreen extends StatelessWidget {
  const ClassTimeTableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final timetable = [
      "Math — 9:00 AM",
      "Science — 10:00 AM",
      "English — 11:00 AM",
      "Break — 12:00 PM",
      "Computer — 1:00 PM",
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Class Timetable")),
      body: ListView(
        children: timetable
            .map((e) => ListTile(
          leading: const Icon(Icons.book),
          title: Text(e),
        ))
            .toList(),
      ),
    );
  }
}