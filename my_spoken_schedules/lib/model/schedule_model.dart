import 'package:my_spoken_schedules/model/task_model.dart';

class ScheduleModel {
  String? id;
  String? label;
  List<String>? days;
  List<TaskModel>? tasks;
  bool? isActive;

  ScheduleModel(
      {this.id, this.label, this.days, List<TaskModel>? tasks, this.isActive})
      : tasks = tasks ?? []; // Initialize tasks as an empty list

  ScheduleModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        label = json['label'],
        days = List<String>.from(json['days'] ?? []),
        tasks = (json['tasks'] as List<dynamic>?)
            ?.map((taskJson) => TaskModel.fromJson(taskJson))
            .toList(),
        isActive = json['isActive'];
}
