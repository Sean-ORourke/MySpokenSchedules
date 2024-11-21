import 'package:flutter/material.dart';

class EditTaskPage extends StatelessWidget {
  final String taskLabel;

  EditTaskPage({required this.taskLabel});
  @override
  Widget build(BuildContext context) {
    final TextEditingController labelController =
        TextEditingController(text: taskLabel);
    final TextEditingController messageController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(taskLabel),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: labelController,
              decoration: InputDecoration(labelText: 'Task Label'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: messageController,
              decoration: InputDecoration(labelText: 'Task Message'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Add logic to select time
              },
              child: Text('Select Time'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Add logic to save changes
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
