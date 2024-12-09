import 'package:flutter/material.dart';
import 'package:my_spoken_schedules/model/task_model.dart';

class TaskViewModel extends ChangeNotifier {
  final TaskModel? taskModel;

  TaskViewModel(this.taskModel);

  updateLabel(String newLabel) {
    debugPrint("Updating task Label... ${taskModel?.id}, ${taskModel?.label}");
    taskModel?.label = newLabel;
    notifyListeners();
  }

  updateMessage(String newMessage) {
    debugPrint("Updating task message... ${taskModel?.id}, ${taskModel?.message}");
    taskModel?.message = newMessage;
    notifyListeners();
  }

  updateTime(TimeOfDay pickedTime) {
    debugPrint("Updating task time... ${taskModel?.id}, ${taskModel?.time}");
    taskModel?.time = pickedTime;
    notifyListeners();
  }

  refreshTasks() {
    notifyListeners();
  }
}
