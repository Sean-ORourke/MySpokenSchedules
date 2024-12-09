import 'package:flutter/material.dart';
import 'package:my_spoken_schedules/model/task_model.dart';

class TaskViewModel extends ChangeNotifier {
  final TaskModel? taskModel;

  TaskViewModel(this.taskModel);

  //id shall never be edited

  updateLabel(String newLabel) {
    debugPrint("Updating task Label... ${taskModel?.id}, ${taskModel?.label}");
    taskModel?.label = newLabel;
    notifyListeners();
  }

  updateDays(List<String> newDays) {
    debugPrint("Updating task Label... ${taskModel?.id}, ${taskModel?.days}");
    taskModel?.days = newDays;
    notifyListeners();
  }

  updateTime(TimeOfDay newTime) {
    debugPrint("Updating task time... ${taskModel?.id}, ${taskModel?.time}");
    taskModel?.time = newTime;
    notifyListeners();
  }

  updateMessage(String newMessage) {
    debugPrint("Updating task message... ${taskModel?.id}, ${taskModel?.message}");
    taskModel?.message = newMessage;
    notifyListeners();
  }

  refreshTask() {
    notifyListeners();
  }
}
