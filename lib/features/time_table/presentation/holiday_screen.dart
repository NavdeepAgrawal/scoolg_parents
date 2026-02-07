import 'package:flutter/material.dart';

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