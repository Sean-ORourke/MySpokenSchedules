import 'package:flutter/material.dart';
import 'package:my_spoken_schedules/model/task_model.dart';

class TaskViewModel extends ChangeNotifier {
  final TaskModel? taskModel;

  TaskViewModel(this.taskModel);

  updateTask(String newLabel, String newMessage) {
    debugPrint("Updating task Label... ${taskModel?.id}, ${taskModel?.label}");
    taskModel?.label = newLabel;
    taskModel?.message = newMessage;
    notifyListeners();
  }
}
