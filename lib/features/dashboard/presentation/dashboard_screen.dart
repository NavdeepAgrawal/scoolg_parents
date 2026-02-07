import 'package:flutter/material.dart';
import 'package:scoolg_parents/common/model/student.dart';
import 'package:scoolg_parents/features/attendance/presentation/attendance_screen.dart';
import 'package:scoolg_parents/features/communication/presentation/communication_screen.dart';
import 'package:scoolg_parents/features/homework/presentation/homework_screen.dart';
import 'package:scoolg_parents/features/performance/presentation/performance_screen.dart';
import 'package:scoolg_parents/features/time_table/presentation/time_table_menu_screen.dart';

import '../../../common/model/toolItem.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final List<ToolItem> tools = const [
    ToolItem("📊 Attendance", AttendanceScreen()),
    ToolItem("📅 Time Table", TimeTableMenuScreen()),
    ToolItem("📝 Homework & Assignments", HomeworkScreen()),
    ToolItem("📈 Academic Performance", PerformanceScreen()),
    ToolItem("💬 Communication", CommunicationScreen()),
  ];

  final List<Student> profiles = [
    Student(id: "", name: "John", image: "https://i.pravatar.cc/150?img=1"),
    Student(id: "", name: "Emma", image: "https://i.pravatar.cc/150?img=2"),
    Student(id: "", name: "Alex", image: "https://i.pravatar.cc/150?img=3"),
  ];

  late Student selectedProfile;

  @override
  void initState() {
    super.initState();
    selectedProfile = profiles[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Parent Dashboard"),
            DropdownButtonHideUnderline(
              child: DropdownButton<Student>(
                value: selectedProfile,
                isDense: true,
                itemHeight: 48, // 👈 IMPORTANT
                menuMaxHeight: 240, // 👈 prevents overflow on small screens
                icon: const Icon(Icons.keyboard_arrow_down),
                onChanged: (Student? newValue) {
                  setState(() {
                    selectedProfile = newValue!;
                  });
                },
                items: profiles.map((profile) {
                  return DropdownMenuItem<Student>(
                    value: profile,
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 14,
                          backgroundImage: NetworkImage(profile.image),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          profile.name,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  );
                }).toList(),
                selectedItemBuilder: (context) {
                  return profiles.map((profile) {
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        CircleAvatar(
                          radius: 18,
                          backgroundImage: NetworkImage(profile.image),
                        ),
                        const SizedBox(width: 4),
                        Text(profile.name, style: TextStyle(fontSize: 12),),
                      ],
                    );
                  }).toList();
                },
              ),
            ),

          ],
        ),
      ),
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
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
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
