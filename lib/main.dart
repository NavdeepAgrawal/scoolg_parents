import 'package:flutter/material.dart';
import 'package:scoolg_parents/common/model/toolItem.dart';
import 'package:scoolg_parents/features/attendance/presentation/attendance_screen.dart';
import 'package:scoolg_parents/features/communication/presentation/communication_screen.dart';
import 'package:scoolg_parents/features/homework/presentation/homework_screen.dart';
import 'package:scoolg_parents/features/performance/presentation/performance_screen.dart';
import 'package:scoolg_parents/features/time_table/presentation/time_table_menu_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SCoolGP',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: HomeScreen(),
    );
  }
}


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<ToolItem> tools = const [
    ToolItem("📊 Attendance", AttendanceScreen()),
    ToolItem("📅 Time Table", TimeTableMenuScreen()),
    ToolItem("📝 Homework & Assignments", HomeworkScreen()),
    ToolItem("📈 Academic Performance", PerformanceScreen()),
    ToolItem("💬 Communication", CommunicationScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Parent Dashboard")),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: tools.length,
        itemBuilder: (context, index) {
          final item = tools[index];
          return Card(
            elevation: 4,
            margin: const EdgeInsets.only(bottom: 14),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              title: Text(
                item.title,
                style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.w600),
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => item.screen),
                );
              },
            ),
          );
        },
      ),
    );
  }
}