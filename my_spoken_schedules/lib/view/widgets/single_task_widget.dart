import 'package:flutter/material.dart';
import 'package:my_spoken_schedules/view_model/schedules_view_model.dart';
import 'package:my_spoken_schedules/view_model/task_view_model.dart';
import 'package:my_spoken_schedules/view/task_detail_view.dart';
import 'package:provider/provider.dart';

class SingleTaskWidget extends StatelessWidget {
  final TaskViewModel taskViewModel;
  final ScheduleViewModel scheduleViewModel; // Add scheduleViewModel

  const SingleTaskWidget({
    Key? key,
    required this.taskViewModel,
    required this.scheduleViewModel, // Add this parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scheduleViewModel =
        Provider.of<ScheduleViewModel>(context, listen: true);
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
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.mode_edit),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TaskDetailView(
                      // taskLabel: taskViewModel.taskModel!.label ?? 'No Label',
                      // taskMessage:
                      //     taskViewModel.taskModel!.message ?? 'No Message',
                          taskViewModel: taskViewModel,
                    ),
                  ),
                );
              },
            ),
            SizedBox(width: 8.0), // Space between buttons
            IconButton(
              icon: Icon(Icons.delete_forever),
              onPressed: () {
                final taskId = taskViewModel.taskModel?.id;
                if (taskId != null) {
                  scheduleViewModel.removeTask(taskId);
                } else {
                  debugPrint("Task ID is null. Cannot remove task.");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
