class TaskModel {
  late int id;
  String? label;
  String? time;
  String? message;

  TaskModel({required this.id, this.label, this.time, this.message});

  TaskModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    label = json['label'];
    time = json['time'];
    message = json['message'];
  }
}
