import 'package:flutter/material.dart';

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