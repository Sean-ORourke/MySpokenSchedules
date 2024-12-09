import 'package:flutter/cupertino.dart';
import 'package:my_spoken_schedules/model/schedule_model.dart';
import 'package:my_spoken_schedules/view_model/schedules_view_model.dart';

class ListSchedulesViewModel extends ChangeNotifier {
  List<ScheduleViewModel> schedules = <ScheduleViewModel>[];
  int newestScheduleID = 2;

  fetchSchedules() {
    // Simulate fetching schedules from a data source
    final List<Map<String, dynamic>> json = [
      {
        "id": 1,
        "label": "MWF Schedule",
        "days": ["Monday", "Wednesday", "Friday"],
        "tasks": [
          {
            "id": 1,
            "label": "Task 1",
            "days": ["Monday", "Wednesday", "Friday"],
            "time": "8:00 AM",
            "message": "Morning meeting"
          },
          {
            "id": 2,
            "label": "Task 2",
            "days": ["Monday", "Wednesday", "Friday"],
            "time": "12:00 PM",
            "message": "Lunch with team"
          },
        ],
        "isActive": true,
        "latestID": 2
      },
      {
        "id": 2,
        "label": "Weekend Schedule",
        "days": ["Saturday", "Sunday"],
        "tasks": [
          {
            "id": 1,
            "label": "Wake Up",
            "days": ["Saturday", "Sunday"],
            "time": "8:00 AM",
            "message": "Class is in 1 hour."
          },
          {
            "id": 2,
            "label": "shop",
            "days": ["Saturday", "Sunday"],
            "time": "10:00 AM",
            "message": "Grocery shopping"
          },
          {
            "id": 3,
            "label": "movie time!",
            "days": ["Saturday", "Sunday"],
            "time": "3:00 PM",
            "message": "Watch a movie"
          },
          {
            "id": 4,
            "label": "Workout",
            "days": ["Saturday", "Sunday"],
            "time": "5:00 PM",
            "message": "Workout Plan: Run, bike, lift weights."
          },
          {
            "id": 5,
            "label": "take Meds",
            "days": ["Saturday", "Sunday"],
            "time": "8:00 PM",
            "message": "ibuprofein, excedrin migrane, multivitamin",
          },
          {
            "id": 6,
            "label": "time for skincare routine",
            "days": ["Saturday", "Sunday"],
            "time": "10:00 PM",
            "message": "sugar scrub, hydrophillic acid, and face lotion",
          }
        ],
        "isActive": true,
        "latestID": 6
      }
    ];

    // Use type-safe parsing
    final List<ScheduleModel> scheduleList =
        json.map((e) => ScheduleModel.fromJson(e)).toList();

    schedules =
        scheduleList.map((schedule) => ScheduleViewModel(schedule)).toList();
    notifyListeners();
  }

  addSchedule() {
    newestScheduleID++;
    final newSchedule = ScheduleModel(
      id: newestScheduleID,
      label: "New Schedule",
      days: [],
      tasks: [],
      isActive: true,
      latestID: 0
    );
    schedules.add(ScheduleViewModel(newSchedule));
    notifyListeners();
  }
}
