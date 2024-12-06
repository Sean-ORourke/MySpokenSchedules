import 'package:flutter/material.dart';
import 'package:my_spoken_schedules/view_model/task_view_model.dart';
import 'package:my_spoken_schedules/view/task_detail_view.dart';
import 'package:provider/provider.dart';
import 'package:my_spoken_schedules/view_model/list_tasks_view_model.dart';

class NewTaskWidget extends StatelessWidget {
  final VoidCallback onAddTask;

  const NewTaskWidget({Key? key, required this.onAddTask}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(50.0),
      title: Text('Add New Task'),
      trailing: Icon(Icons.add_box_outlined),
      onTap: onAddTask, // Trigger the callback to add a new task
    );
  }
}

// class NewTaskWidget extends StatelessWidget {
//   // final TasksViewModel taskViewModel;

//   const NewTaskWidget//({Key? key, required this.taskViewModel}) : super(key: key);
//   (Key? key) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final vm = Provider.of<ListTasksViewModel>(context);
//     return Card(
//       margin: EdgeInsets.all(8.0),
//       child: IconButton(
//               icon: Icon(Icons.add_box),
//               onPressed: () {
//                 vm.addTask();
//               },
//             )
//     );
//   }
// }