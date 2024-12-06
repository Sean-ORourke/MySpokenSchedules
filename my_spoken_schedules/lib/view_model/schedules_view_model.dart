import 'package:flutter/cupertino.dart';
import 'package:my_spoken_schedules/model/schedule_model.dart';
import 'package:my_spoken_schedules/model/task_model.dart';
import 'package:provider/provider.dart';

class SchedulesViewModel extends ChangeNotifier {
  final ScheduleModel? scheduleModel;

  SchedulesViewModel(this.scheduleModel);

  int latestID = 3;

  void addTask() {
  debugPrint("Adding task...");
  final newTask = TaskModel(
    id: latestID.toString(),
    label: "New Task",
    time: DateTime.now().toString(),
    message: "New task details",
  );
  scheduleModel?.tasks?.add(newTask);
  latestID++;
  notifyListeners();
  debugPrint("Task added. Total tasks: ${scheduleModel?.tasks?.length}");
}


 void removeTask(String taskId) {
  debugPrint("Removing task with ID: $taskId");
  scheduleModel?.tasks?.removeWhere((task) => task?.id == taskId);
  notifyListeners();
  debugPrint("Task removed. Remaining tasks: ${scheduleModel?.tasks?.length}");
}

}



// import 'package:flutter/cupertino.dart';
// import 'package:my_spoken_schedules/model/schedule_model.dart';
// import 'package:my_spoken_schedules/model/task_model.dart';
// import 'package:provider/provider.dart';


// class SchedulesViewModel extends ChangeNotifier {
//   final schedule_model? scheduleModel;

//   SchedulesViewModel(this.scheduleModel);

//   int latestID = 3;

//   addTask() {
//     final newTask = task_model(
//       id: latestID.toString(),
//       label: "New Task",
//       time: DateTime.now().toString(),
//       message: "New task details",
//     );

//     scheduleModel?.tasks?.add(newTask);
//     latestID++;
//     notifyListeners();
//   }

//   removeTask(String taskId) {
//     scheduleModel?.tasks?.removeWhere((task) => task.id == taskId);
//     notifyListeners();
//   }
// }





// import 'package:my_spoken_schedules/model/task_model.dart';
// import 'package:my_spoken_schedules/model/schedule_model.dart';

// class SchedulesViewModel {
//   final schedule_model? scheduleModel;

//   SchedulesViewModel(this.scheduleModel);
// }
