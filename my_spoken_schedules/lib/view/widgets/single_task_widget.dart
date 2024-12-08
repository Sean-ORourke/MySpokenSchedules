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
    required this.scheduleViewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //scheduleViewModel = Provider.of<ScheduleViewModel>(context, listen: true);
        // taskViewModel =
        // Provider.of<TaskViewModel>(context, listen: true);
      taskViewModel.refreshTasks();
    return Card( 
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(
          taskViewModel.taskModel!.label 
          ??
              'No Label', 
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: RichText(
          text: TextSpan( 
            text: taskViewModel.taskModel!.time ?? "No Time",
            style: const TextStyle(color: Colors.black),
            children: <TextSpan>[
              TextSpan(text: "\n\n${taskViewModel.taskModel!.message ?? 'No Message'}", style: const TextStyle(color: Colors.grey)),
            ],
        ),
      ),
      
        
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.mode_edit),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TaskDetailView(
                      taskViewModel: taskViewModel,
                      scheduleViewModel: scheduleViewModel,
                    ),
                  ),
                )
                // .then((_) {
                //   setState() {
                //     taskViewModel.refreshTasks();
                //     scheduleViewModel.refreshTasks();
                //     taskViewModel = taskViewModel;
                //     scheduleViewModel = scheduleViewModel;
                //     this.initState();
                //   }
                // })
                ;
              },
            ),
            const SizedBox(width: 8.0), // Space between buttons
            IconButton(
              icon: const Icon(Icons.delete_forever),
              onPressed: () {
                final taskId = taskViewModel.taskModel?.id;
                if (taskId != null) {
                  scheduleViewModel.removeTask(taskId);
                  // taskViewModel.refreshTasks();
                  // notifyListeners();
                } else {
                  debugPrint("Task ID is null. Cannot remove task.");
                  // taskViewModel.refreshTasks();
                  // notifyListeners();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
