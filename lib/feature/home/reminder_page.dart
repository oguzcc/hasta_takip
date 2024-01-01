import 'package:flutter/material.dart';

class ReminderPage extends StatelessWidget {
  const ReminderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Icon(Icons.notifications, size: 50),
        toolbarHeight: 100,
      ),
      body: const Center(child: Text('Reminder Page')),
    );
  }
}
