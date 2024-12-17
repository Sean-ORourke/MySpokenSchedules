import 'package:my_spoken_schedules/model/task_model.dart';

class ScheduleModel {
  int id;
  String? label;
  List<String>? days;
  List<TaskModel>? tasks;
  bool? isActive;
  int latestID;

  ScheduleModel(
      {required this.id, this.label, this.days, List<TaskModel>? tasks, this.isActive, required this.latestID})
      : tasks = tasks ?? []; // Initialize tasks as an empty list

  ScheduleModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        label = json['label'],
        days = List<String>.from(json['days'] ?? []),
        tasks = (json['tasks'] as List<dynamic>?)
            ?.map((taskJson) => TaskModel.fromJson(taskJson))
            .toList(),
        isActive = json['isActive'],
        latestID = json["latestID"];
  
   void sortTasksByTime() {
    if (tasks == null) return;

    // Sort and assign back the sorted list
    tasks = List.from(tasks!)..sort((a, b) {
      if (a.time == null || b.time == null) return 0; // Handle null times
      return a.time!.hour == b.time!.hour
          ? a.time!.minute.compareTo(b.time!.minute) // Compare minutes if hours are equal
          : a.time!.hour.compareTo(b.time!.hour); // Compare hours
    });
  }
}
