import 'package:flutter/material.dart';

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



////////////////////////////////////////////////////////////
/// HOME SCREEN
////////////////////////////////////////////////////////////

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<_ToolItem> tools = const [
    _ToolItem("📊 Attendance", AttendanceScreen()),
    _ToolItem("📅 Time Table", TimeTableMenuScreen()),
    _ToolItem("📝 Homework & Assignments", HomeworkScreen()),
    _ToolItem("📈 Academic Performance", PerformanceScreen()),
    _ToolItem("💬 Communication", CommunicationScreen()),
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

class _ToolItem {
  final String title;
  final Widget screen;
  const _ToolItem(this.title, this.screen);
}

////////////////////////////////////////////////////////////
/// ATTENDANCE
////////////////////////////////////////////////////////////

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      {"date": "01 Feb", "status": "Present"},
      {"date": "02 Feb", "status": "Present"},
      {"date": "03 Feb", "status": "Absent"},
      {"date": "04 Feb", "status": "Present"},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Attendance")),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (_, i) {
          return ListTile(
            leading: const Icon(Icons.calendar_today),
            title: Text(data[i]["date"]!),
            trailing: Text(
              data[i]["status"]!,
              style: TextStyle(
                color: data[i]["status"] == "Present"
                    ? Colors.green
                    : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ),
    );
  }
}

////////////////////////////////////////////////////////////
/// TIME TABLE MENU
////////////////////////////////////////////////////////////

class TimeTableMenuScreen extends StatelessWidget {
  const TimeTableMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      _ToolItem("Class Timetable", const ClassTimeTableScreen()),
      _ToolItem("Exam Timetable", const ExamTimeTableScreen()),
      _ToolItem("Holiday List", const HolidayScreen()),
      _ToolItem("Special Event Schedule", const EventScreen()),
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

////////////////////////////////////////////////////////////
/// CLASS TIMETABLE
////////////////////////////////////////////////////////////

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

////////////////////////////////////////////////////////////
/// EXAM TIMETABLE
////////////////////////////////////////////////////////////

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

////////////////////////////////////////////////////////////
/// HOLIDAY LIST
////////////////////////////////////////////////////////////

class HolidayScreen extends StatelessWidget {
  const HolidayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final holidays = [
      "Republic Day — 26 Jan",
      "Holi — 8 Mar",
      "Diwali — 1 Nov",
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Holiday List")),
      body: ListView(
        children: holidays
            .map((e) => ListTile(
          leading: const Icon(Icons.beach_access),
          title: Text(e),
        ))
            .toList(),
      ),
    );
  }
}

////////////////////////////////////////////////////////////
/// EVENTS
////////////////////////////////////////////////////////////

class EventScreen extends StatelessWidget {
  const EventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final events = [
      "Sports Day — 20 Feb",
      "Annual Function — 15 Mar",
      "Science Fair — 10 Apr",
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Special Events")),
      body: ListView(
        children: events
            .map((e) => ListTile(
          leading: const Icon(Icons.event),
          title: Text(e),
        ))
            .toList(),
      ),
    );
  }
}

////////////////////////////////////////////////////////////
/// HOMEWORK
////////////////////////////////////////////////////////////

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

////////////////////////////////////////////////////////////
/// PERFORMANCE
////////////////////////////////////////////////////////////

class PerformanceScreen extends StatelessWidget {
  const PerformanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scores = {
      "Math": "85%",
      "Science": "78%",
      "English": "92%",
    };

    return Scaffold(
      appBar: AppBar(title: const Text("Academic Performance")),
      body: ListView(
        children: scores.entries
            .map((e) => ListTile(
          leading: const Icon(Icons.bar_chart),
          title: Text(e.key),
          trailing: Text(
            e.value,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ))
            .toList(),
      ),
    );
  }
}

////////////////////////////////////////////////////////////
/// COMMUNICATION
////////////////////////////////////////////////////////////

class CommunicationScreen extends StatelessWidget {
  const CommunicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final messages = [
      "Teacher: Please submit homework",
      "School: Holiday tomorrow",
      "Teacher: Good progress!",
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Communication")),
      body: ListView(
        children: messages
            .map((e) => ListTile(
          leading: const Icon(Icons.message),
          title: Text(e),
        ))
            .toList(),
      ),
    );
  }
}
