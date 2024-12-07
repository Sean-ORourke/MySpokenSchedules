import 'package:flutter/cupertino.dart';
import 'package:my_spoken_schedules/model/schedule_model.dart';
import 'package:my_spoken_schedules/model/task_model.dart';


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
      time: DateTime.now().toString(),
      message: "New task message",
    );
    scheduleModel.tasks?.add(newTask);
    notifyListeners();
    debugPrint("Task added. Total tasks: ${scheduleModel.tasks?.length}");
  }

  void removeTask(int taskId) {
    debugPrint("Removing task with ID: $taskId");
    scheduleModel.tasks?.removeWhere((task) => task.id == taskId);
    notifyListeners();
    debugPrint(
        "Task removed. Remaining tasks: ${scheduleModel.tasks?.length}");
  }

  refreshTasks() {
    notifyListeners();
  }
}
