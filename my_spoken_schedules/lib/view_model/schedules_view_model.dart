import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_spoken_schedules/model/schedule_model.dart';
import 'package:my_spoken_schedules/model/task_model.dart';
import 'package:my_spoken_schedules/view_model/task_view_model.dart';
import 'package:my_spoken_schedules/service/notification.dart';

class ScheduleViewModel extends ChangeNotifier {
  final ScheduleModel scheduleModel;

  ScheduleViewModel(this.scheduleModel);

  void addTask() {
    debugPrint("Adding task...");
    scheduleModel.latestID++;
    debugPrint("Task ${scheduleModel.latestID}");
    // debugPrint(newTask.days.toString());
    final newTask = TaskModel(
      id: scheduleModel.latestID,
      label: "New Task 💡",
      days: scheduleModel.days,
      time: TimeOfDay.now(),
      message: "New task message",
    );
    debugPrint(newTask.days.toString());
    scheduleModel.tasks?.add(newTask);
    NotificationService.initNotification(newTask, scheduleModel);
    notifyListeners();
    debugPrint("Task added. Total tasks: ${scheduleModel.tasks?.length}");
  }

  void removeTask(int taskId) {
    debugPrint("Removing task with ID: $taskId");

    for (int i = 0; i < (scheduleModel.tasks?.length ?? 0); i++) {
      debugPrint("$taskId == ${scheduleModel.tasks?[i].id}?");

      if (taskId == scheduleModel.tasks?[i].id) {
        debugPrint("YES, $taskId == ${scheduleModel.tasks?[i].id}");
        NotificationService.cancelNotification(scheduleModel.tasks?[i] as TaskModel, scheduleModel);
        scheduleModel.tasks?.removeAt(i);
        break;
      }
    }
    debugPrint("Task removed. Remaining tasks: ${scheduleModel.tasks?.length}");
    notifyListeners();
  }

  updateLabel(String newLabel) {
    debugPrint(
        "Updating Schedule Label... ${scheduleModel.id}, ${scheduleModel.label}");
    scheduleModel.label = newLabel;
    notifyListeners();
  }

  updateDays(bool isDayChecked, String newDay) {
    debugPrint(
        "Updating Schedule Days... ${scheduleModel.id}, ${scheduleModel.days}");

        
        

    if (isDayChecked) {

      // is this day already in the list?
      bool repeat = (scheduleModel.days?.contains(newDay) ?? false);
      if (!repeat) {
        scheduleModel.days!.add(newDay);
      }

      List<String>? oldDays = scheduleModel.days;

        // remove days
        scheduleModel.days = [];

        bool hasMonday = false;
        if(oldDays?.contains("Monday") ?? false || newDay == "Monday") {
          scheduleModel.days!.add("Monday");
          hasMonday = true;
        }

        bool hasTuesday = false;
        if(oldDays?.contains("Tuesday") ?? false || newDay == "Tuesday") {
          scheduleModel.days!.add("Tuesday");
          hasTuesday = true;
        }

        bool hasWednesday = false;
        if(oldDays?.contains("Wednesday") ?? false || newDay == "Wednesday") {
          scheduleModel.days!.add("Wednesday");
          hasWednesday = true;
        }

        bool hasThursday = false;
        if(oldDays?.contains("Thursday") ?? false || newDay == "Thursday") {
          scheduleModel.days!.add("Thursday");
          hasThursday = true;
        }

        bool hasFriday = false;
        if(oldDays?.contains("Friday") ?? false || newDay == "Friday") {
          scheduleModel.days!.add("Friday");
          hasFriday = true;
        }

        bool hasSaturday = false;
        if(oldDays?.contains("Saturday") ?? false || newDay == "Saturday") {
          scheduleModel.days!.add("Saturday");
          hasSaturday = true;
        }

        bool hasSunday = false;
        if(oldDays?.contains("Sunday") ?? false || newDay == "Sunday") {
          scheduleModel.days!.add("Sunday");
          hasSunday = true;
        }
      
        scheduleModel.tasks?.forEach((task) => task.days?.add(newDay));

    } else {
      scheduleModel.days!.removeWhere((day) => day == newDay);

          scheduleModel.tasks?.forEach((task) => task.days?.removeWhere((day) => day == newDay));

    }
    debugPrint(
        "Updated Schedule Days... ${scheduleModel.id}, ${scheduleModel.days}");
    notifyListeners();
  }

  updateIsActive(bool newIsActive) {
    debugPrint(
        "Updating Schedule isActive... ${scheduleModel.id}, ${scheduleModel.isActive}");
    scheduleModel.isActive = newIsActive;
    if (!newIsActive) {
      for (int i = 0; i < (scheduleModel.tasks?.length ?? 0); i++) {
        NotificationService.cancelNotification(scheduleModel.tasks?[i] as TaskModel, scheduleModel);
      }
    }
    notifyListeners();
  }

  updateNotifs(){
    debugPrint("updateNotifSchedules");
    for (int i = 0; i < (scheduleModel.tasks?.length ?? 0); i++) {
      NotificationService.initNotification(scheduleModel.tasks?[i] as TaskModel, scheduleModel);
    }
  }

  refreshTasks() {
    notifyListeners();
  }
}
