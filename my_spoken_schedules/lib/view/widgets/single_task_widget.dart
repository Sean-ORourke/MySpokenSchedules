import 'package:flutter/material.dart';
import 'package:my_spoken_schedules/view_model/schedules_view_model.dart';
import 'package:my_spoken_schedules/view_model/tasks_view_model.dart';
import 'package:my_spoken_schedules/view/task_detail_view.dart';
import 'package:provider/provider.dart';

class SingleTaskWidget extends StatelessWidget {
  final TasksViewModel taskViewModel;
  final SchedulesViewModel scheduleViewModel; // Add scheduleViewModel

  const SingleTaskWidget({
    Key? key,
    required this.taskViewModel,
    required this.scheduleViewModel, // Add this parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scheduleViewModel = Provider.of<SchedulesViewModel>(context, listen: true);
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(
          taskViewModel.taskModel!.label ?? 'No Label', // Provide a default value
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          taskViewModel.taskModel!.message ?? 'No Message', // Provide a default value
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
                    builder: (context) => EditTaskPage(
                      taskLabel: taskViewModel.taskModel!.label ?? 'No Label',
                      taskMessage: taskViewModel.taskModel!.message ?? 'No Message',
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






// import 'package:flutter/material.dart';
// import 'package:my_spoken_schedules/view_model/tasks_view_model.dart';
// import 'package:my_spoken_schedules/view/task_detail_view.dart';
// import 'package:provider/provider.dart';
// import 'package:my_spoken_schedules/view_model/list_tasks_view_model.dart';

// class SingleTaskWidget extends StatelessWidget {
//   final TasksViewModel taskViewModel;

//   const SingleTaskWidget({Key? key, required this.taskViewModel})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final vm = Provider.of<ListTasksViewModel>(context);
//     return Card(
//       margin: EdgeInsets.all(8.0),
//       child: ListTile(
//         title: Text(
//           taskViewModel.taskModel!.label ??
//               'No Label', // Provide a default value
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         subtitle: Text(
//           taskViewModel.taskModel!.message ??
//               'No Message', // Provide a default value
//           style: TextStyle(color: Colors.grey),
//         ),
//         trailing: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             IconButton(
//               icon: Icon(Icons.mode_edit),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => EditTaskPage(
//                           taskLabel:
//                               taskViewModel.taskModel!.label ?? 'No Label', taskMessage: taskViewModel.taskModel!.message ?? 'No Message',)),
//                 );
//               },
//             ),
//             SizedBox(width: 8.0), // Space between buttons
//             IconButton(
//               icon: Icon(Icons.delete_forever),
//               onPressed: () {
//                 final taskId = taskViewModel.taskModel?.id;
//                 scheduleViewModel.removeTask(taskId!);
                
//                 // // Add logic to delete task
//                 // vm.removeTasks(taskViewModel.taskModel!.id ?? 'No id');
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
