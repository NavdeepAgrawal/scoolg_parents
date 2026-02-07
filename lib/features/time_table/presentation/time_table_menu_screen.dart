import 'package:flutter/material.dart';
import 'package:scoolg_parents/common/model/toolItem.dart';
import 'package:scoolg_parents/features/time_table/presentation/class_time_table_screen.dart';
import 'package:scoolg_parents/features/time_table/presentation/event_screen.dart';
import 'package:scoolg_parents/features/time_table/presentation/exam_time_table_screen.dart';
import 'package:scoolg_parents/features/time_table/presentation/holiday_screen.dart';

class TimeTableMenuScreen extends StatelessWidget {
  const TimeTableMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      ToolItem("Class Timetable", const ClassTimeTableScreen()),
      ToolItem("Exam Timetable", const ExamTimeTableScreen()),
      ToolItem("Holiday List", const HolidayScreen()),
      ToolItem("Special Event Schedule", const EventScreen()),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Time Table")),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: items.length,
        itemBuilder: (_, i) {
          return Card(
            child: ListTile(
              title: Text(items[i].title),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => items[i].screen),
                );
              },
            ),
          );
        },
      ),
    );
  }
}