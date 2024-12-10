import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_spoken_schedules/model/schedule_model.dart';
import 'package:my_spoken_schedules/view_model/schedules_view_model.dart';
import 'package:my_spoken_schedules/notification/notification.dart';
import 'package:my_spoken_schedules/model/task_model.dart';

class ListSchedulesViewModel extends ChangeNotifier {
  List<ScheduleViewModel> schedules = <ScheduleViewModel>[];
  int newestScheduleID = 2;

  fetchSchedules() {
    // Simulate fetching schedules from a data source
    final List<Map<String, dynamic>> json = [
      {
        "id": 1,
        "label": "WFH Days Work Schedule 🖥️",
        "days": ["Monday", "Wednesday", "Friday"],
        "tasks": [
          {
            "id": 1,
            "label": "Morning meeting 🧍‍♀️🧍‍♀️🧍‍♀️",
            "days": ["Monday", "Wednesday", "Friday"],
            "time": const TimeOfDay(hour: 8, minute: 0),
            "message": "Meeting in 10 minutes. Remember to bring the coffee and sprint reports!"
          },
          {
            "id": 2,
            "label": "Lunch with team 🥪",
            "days": ["Monday", "Wednesday", "Friday"],
            "time": const TimeOfDay(hour: 12, minute: 0),
            "message": "It is now 12PM. Break for lunch."
          },
        ],
        "isActive": true,
        "latestID": 2
      },
      {
        "id": 2,
        "label": "Weekend Schedule 🎉",
        "days": ["Saturday", "Sunday"],
        "tasks": [
          {
            "id": 1,
            "label": "Wake Up 🌤️",
            "days": ["Saturday", "Sunday"],
            "time": const TimeOfDay(hour: 8, minute: 0),
            "message": "Class is in 1 hour."
          },
          {
            "id": 2,
            "label": "shop 🛍️",
            "days": ["Saturday", "Sunday"],
            "time": const TimeOfDay(hour: 10, minute: 0),
            "message": "Grocery shopping"
          },
          {
            "id": 3,
            "label": "movie time! 🍿",
            "days": ["Saturday", "Sunday"],
            "time": const TimeOfDay(hour: 15, minute: 0),
            "message": "Watch a movie"
          },
          {
            "id": 4,
            "label": "Workout 💪",
            "days": ["Saturday", "Sunday"],
            "time": const TimeOfDay(hour: 17, minute: 30),
            "message": "Workout Plan: Run, bike, lift weights."
          },
          {
            "id": 5,
            "label": "take Meds 💊",
            "days": ["Saturday", "Sunday"],
            "time": const TimeOfDay(hour: 18, minute: 45),
            "message": "ibuprofein, excedrin migrane, multivitamin",
          },
          {
            "id": 6,
            "label": "time for skincare routine 🫧",
            "days": ["Saturday", "Sunday"],
            "time": const TimeOfDay(hour: 19, minute: 0),
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
    
    for (var schedule in schedules) {
      for (int i = 0; i < (schedule.scheduleModel.tasks?.length ?? 0); i++) {
        NotificationService.initNotification(schedule.scheduleModel.tasks?[i] as TaskModel, schedule.scheduleModel);
      }
    }

    notifyListeners();
  }

  addSchedule() {
    newestScheduleID++;
    final newSchedule = ScheduleModel(
      id: newestScheduleID,
      label: "New Schedule ✍️",
      days: [],
      tasks: [],
      isActive: true,
      latestID: 0
    );
    // debugPrint(newSchedule.days.toString());
    schedules.add(ScheduleViewModel(newSchedule));
    notifyListeners();
  }

  removeSchedule(int id) {
    debugPrint("deleting schedule $id");
    for (var schedule in schedules) {
      if (schedule.scheduleModel.id == id) {
        for (int i = 0; i < (schedule.scheduleModel.tasks?.length ?? 0); i++) {
          NotificationService.cancelNotification(schedule.scheduleModel.tasks?[i] as TaskModel, schedule.scheduleModel);
        }
      }
    }
    schedules.removeWhere((schedule) => schedule.scheduleModel.id == id);
    // schedules.where((schedule) => id == id);
    // ScheduleViewModel schedule = schedules.firstWhere((schedule) => schedule.scheduleModel.id == id);
    // schedule.refreshTasks();
    notifyListeners();
  }

  refreshSchedules(){
    notifyListeners();
  }
}
