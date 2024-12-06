import 'package:flutter/cupertino.dart';
import 'package:my_spoken_schedules/model/schedule_model.dart';
import 'package:my_spoken_schedules/view_model/schedules_view_model.dart';



class ListSchedulesViewModel extends ChangeNotifier {
  List<SchedulesViewModel> schedules = <SchedulesViewModel>[];

 fetchSchedules() {
  // Simulate fetching schedules from a data source
  final List<Map<String, dynamic>> json = [
    {
      "id": "1",
      "label": "MWF Schedule",
      "days": ["Monday", "Wednesday", "Friday"],
      "tasks": [
        {"id": "1", "label": "Task 1", "time": "8:00 AM", "message": "Morning meeting"},
        {"id": "2", "label": "Task 2", "time": "12:00 PM", "message": "Lunch with team"},
      ],
      "isActive": true,
    },
    {
      "id": "2",
      "label": "Weekend Schedule",
      "days": ["Saturday", "Sunday"],
      "tasks": [
        {"id": "1", "label": "Task 1", "time": "10:00 AM", "message": "Grocery shopping"},
        {"id": "2", "label": "Task 2", "time": "3:00 PM", "message": "Watch a movie"},
      ],
      "isActive": true,
    }
  ];

  // Use type-safe parsing
  final List<schedule_model> scheduleList = json.map((e) => schedule_model.fromJson(e)).toList();

  this.schedules = scheduleList.map((schedule) => SchedulesViewModel(schedule)).toList();
  notifyListeners();
}


  
  // fetchSchedules() {
  //   // Simulate fetching schedules from a data source
  //   final List<dynamic> json = [
  //     {
  //       "id": "1",
  //       "label": "MWF Schedule",
  //       "days": ["Monday", "Wednesday", "Friday"],
  //       "tasks": [],
  //       "isActive": true,
  //     },
  //     {
  //       "id": "2",
  //       "label": "Weekend Schedule",
  //       "days": ["Saturday", "Sunday"],
  //       "tasks": [],
  //       "isActive": true,
  //     }
  //   ];

  //   final scheduleList = json.map((e) => schedule_model.fromJson(e)).toList();
  //   this.schedules = scheduleList.map((schedule) => SchedulesViewModel(schedule)).toList();
  //   notifyListeners();
  // }

  addSchedule() {
    final newSchedule = schedule_model(
      id: DateTime.now().toString(),
      label: "New Schedule",
      days: [],
      tasks: [],
      isActive: true,
    );

    schedules.add(SchedulesViewModel(newSchedule));
    notifyListeners();
  }
}





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
