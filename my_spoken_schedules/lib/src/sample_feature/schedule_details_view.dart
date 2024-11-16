import 'package:flutter/material.dart';

/// Displays detailed information about a Schedule.
class SchedulesDetailsView extends StatelessWidget {
  const SchedulesDetailsView({super.key});

  static const routeName = '/schedule';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Schedule Details'),
      ),
      body: const Center(
        child: Text('Tasks Go Here'),
      ),
    );
  }
}
