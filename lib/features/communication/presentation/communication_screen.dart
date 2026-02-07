import 'package:flutter/material.dart';

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