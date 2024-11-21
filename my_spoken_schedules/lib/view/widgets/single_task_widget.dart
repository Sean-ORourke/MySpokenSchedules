import 'package:flutter/material.dart';
import 'package:my_spoken_schedules/view_model/tasks_view_model.dart';

class SingleTaskWidget extends StatelessWidget {
  final TasksViewModel taskViewModel;

  const SingleTaskWidget({Key? key, required this.taskViewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(
          taskViewModel.taskModel!.label ??
              'No Label', // Provide a default value
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          taskViewModel.taskModel!.message ??
              'No Message', // Provide a default value
          style: TextStyle(color: Colors.grey),
        ),
        trailing: Icon(Icons.check_circle_outline),
      ),
    );
  }
}
