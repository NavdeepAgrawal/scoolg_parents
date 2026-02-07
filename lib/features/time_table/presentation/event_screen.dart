
import 'package:flutter/material.dart';

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