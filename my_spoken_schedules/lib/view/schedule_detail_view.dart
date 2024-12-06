import 'package:flutter/material.dart';
import 'package:my_spoken_schedules/view/widgets/single_task_widget.dart';
import 'package:my_spoken_schedules/view_model/schedules_view_model.dart';
import 'package:my_spoken_schedules/view_model/tasks_view_model.dart';
import 'package:provider/provider.dart';

class ScheduleDetailView extends StatelessWidget {
  final SchedulesViewModel scheduleViewModel;

  const ScheduleDetailView({Key? key, required this.scheduleViewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scheduleViewModel = Provider.of<SchedulesViewModel>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text(scheduleViewModel.scheduleModel?.label ?? 'Schedule Details'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: scheduleViewModel.scheduleModel?.tasks?.length ?? 0,
              itemBuilder: (context, index) {
                final task = scheduleViewModel.scheduleModel!.tasks![index];
                return SingleTaskWidget(
                  taskViewModel: TaskViewModel(task),
                  scheduleViewModel: scheduleViewModel,
                );
              },
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {
              scheduleViewModel.addTask();
            },
            icon: Icon(Icons.add),
            label: Text('Add Task'),
          ),
        ],
      ),
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:my_spoken_schedules/view/widgets/single_task_widget.dart';
// import 'package:provider/provider.dart';
// import 'package:my_spoken_schedules/view_model/schedules_view_model.dart';
// import 'package:my_spoken_schedules/view_model/tasks_view_model.dart';

// class ScheduleDetailView extends StatelessWidget {
//   final SchedulesViewModel scheduleViewModel;

//   const ScheduleDetailView({Key? key, required this.scheduleViewModel}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(scheduleViewModel.scheduleModel?.label ?? 'Schedule Details'),
//       ),
//       body: ListView.builder(
//         itemCount: scheduleViewModel.scheduleModel?.tasks?.length ?? 0 + 1,
//         itemBuilder: (context, index) {
//           if (index == scheduleViewModel.scheduleModel!.tasks!.length) {
//             return ListTile(
//               title: Text('Add New Task'),
//               trailing: Icon(Icons.add),
//               onTap: () {
//                 // Add a new task
//                 scheduleViewModel.addTask();
//               },
//             );
//           }
//           final task = scheduleViewModel.scheduleModel!.tasks![index];
//           return SingleTaskWidget(
//             taskViewModel: TasksViewModel(task),
//           );
//         },
//       ),
//     );
//   }
// }
