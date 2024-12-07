import 'package:flutter/material.dart';
import 'package:my_spoken_schedules/view_model/schedules_view_model.dart';
import 'package:my_spoken_schedules/view_model/task_view_model.dart';
import 'package:my_spoken_schedules/view/task_detail_view.dart';
import 'package:provider/provider.dart';

class SingleTaskWidget extends StatefulWidget {
  final TaskViewModel taskViewModel;
  final ScheduleViewModel scheduleViewModel; // Add scheduleViewModel

  const SingleTaskWidget({
    Key? key,
    required this.taskViewModel,
    required this.scheduleViewModel, // Add this parameter
  }) : super(key: key);

   @override
  _SingleTaskWidgetState createState() => _SingleTaskWidgetState();

}

  class _SingleTaskWidgetState extends State<SingleTaskWidget> {
  late ScheduleViewModel scheduleViewModel;
  late TaskViewModel taskViewModel;
  TimeOfDay? selectedTime; // Store the selected time

  _SingleTaskWidgetState();

  @override
  void initState() {
    super.initState();
    taskViewModel = widget.taskViewModel!;
    scheduleViewModel = widget.scheduleViewModel!;
    scheduleViewModel.refreshTasks();
    print("SINGLE TASK WIDGET INIT STATE");
  }

  @override
  Widget build(BuildContext context) {
    scheduleViewModel =
        Provider.of<ScheduleViewModel>(context, listen: true);
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(
          taskViewModel.taskModel!.label ??
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
              icon: Icon(Icons.mode_edit),
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
                //     taskViewModel = taskViewModel;
                //     scheduleViewModel = scheduleViewModel;
                //   }
                // })
                ;
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
