// import 'dart:convert';

// import 'package:flutter/cupertino.dart';
// import 'package:my_spoken_schedules/model/task_model.dart';
// import 'package:my_spoken_schedules/model/schedule_model.dart';

// import 'package:my_spoken_schedules/view_model/schedules_view_model.dart';
// import 'package:my_spoken_schedules/view_model/tasks_view_model.dart';
// import 'package:provider/provider.dart';

// class ListSchedulesViewModel extends ChangeNotifier {
//   List<SchedulesViewModel> schedules = <SchedulesViewModel>[];

//   fetchSchedules() {

//     //this.id, this.label, this.days, this.tasks, this.isActive

//     final List<dynamic> json = [
//       {
//         "label": "MWF Schedule",
//         "days": ["Monday", "Wednesday", "Friday"],
//         "tasks": task_model,
//         "isActive": true,
//       },
//       {
//         "label": "TuesdayNewsDay",
//         "days": ["Tuesday"],
//         "tasks": task_model,
//         "isActive": true,
//       }
//     ];

//     // Parse JSON into TaskModel objects
//     final scheduleList = json
//         .map((e) => task_model(label: e["label"], message: e["message"]))
//         .toList();

//     // Map TaskModel to TasksViewModel
//     this.schedules = scheduleList.map((schedule) => SchedulesViewModel(schedule)).toList();

//     // all I have to do is fill this.tasks with a List<TasksViewModel>

//     notifyListeners();
//   }
// }
