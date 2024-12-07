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
}
