import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

/// Displays detailed information about a Task.
class TasksDetailsView extends StatelessWidget {
  const TasksDetailsView({super.key});

  static const routeName = '/task';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Task Details'),
        ),
        body: const Center(
            child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Label',
              ),
            ),
            // put time picker here!!
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Message',
              ),
            ),
          ],
        )));
  }
}
