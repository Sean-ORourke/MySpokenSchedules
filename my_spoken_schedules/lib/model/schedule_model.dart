import 'package:my_spoken_schedules/model/task_model.dart';

class schedule_model {
  String? id;
  String? label;
  List<String>? days;
  List<task_model>? tasks;
  bool? isActive;

  schedule_model({this.id, this.label, this.days, this.tasks, this.isActive});

  schedule_model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    label = json['label'];
    days = json['days'];
    tasks = json['tasks'];
    isActive = json['isActive'];
  }
}
