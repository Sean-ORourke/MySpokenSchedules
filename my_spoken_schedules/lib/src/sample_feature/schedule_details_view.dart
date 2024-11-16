import 'package:flutter/material.dart';
import 'package:my_spoken_schedules/src/sample_feature/task_list_view.dart';

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
        child: TaskListView(),
      ),
    );
  }
}
