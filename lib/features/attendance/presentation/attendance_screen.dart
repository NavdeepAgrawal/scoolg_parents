
import 'package:flutter/material.dart';

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