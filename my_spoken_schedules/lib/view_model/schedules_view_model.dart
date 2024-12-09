import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_spoken_schedules/model/schedule_model.dart';
import 'package:my_spoken_schedules/model/task_model.dart';
import 'package:my_spoken_schedules/view_model/task_view_model.dart';

class ScheduleViewModel extends ChangeNotifier {
  final ScheduleModel scheduleModel;

  ScheduleViewModel(this.scheduleModel);

  void addTask() {
    debugPrint("Adding task...");
    scheduleModel.latestID++;
    debugPrint("Task ${scheduleModel.latestID}");
    final newTask = TaskModel(
      id: scheduleModel.latestID,
      label: "New Task",
      days: this.scheduleModel.days,
      time: TimeOfDay.now(),
      message: "New task message",
    );
    scheduleModel.tasks?.add(newTask);
    notifyListeners();
    debugPrint("Task added. Total tasks: ${scheduleModel.tasks?.length}");
  }

  void removeTask(int taskId) {

    debugPrint("Removing task with ID: $taskId");

    for (int i = 0; i < (scheduleModel.tasks?.length ?? 0); i++) {

      debugPrint("$taskId == ${scheduleModel.tasks?[i].id}?");

      if (taskId == scheduleModel.tasks?[i].id) {
        debugPrint("YES, $taskId == ${scheduleModel.tasks?[i].id}");
        scheduleModel.tasks?.removeAt(i);
        break;
      }
    }
    debugPrint("Task removed. Remaining tasks: ${scheduleModel.tasks?.length}");
    notifyListeners();
  }

  updateLabel(String newLabel) {
    debugPrint("Updating Schedule Label... ${scheduleModel.id}, ${scheduleModel.label}");
    scheduleModel.label = newLabel;
    notifyListeners();
  }

  updateIsActive(bool newIsActive) {
    debugPrint("Updating Schedule isActive... ${scheduleModel.id}, ${scheduleModel.isActive}");
    scheduleModel.isActive = newIsActive;
    notifyListeners();
  }

  refreshTasks() {
    notifyListeners();
  }
}
