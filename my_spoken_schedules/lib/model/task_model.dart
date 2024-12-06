class TaskModel {
  String? id;
  String? label;
  String? time;
  String? message;

  TaskModel({this.id, this.label, this.time, this.message});

  TaskModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    label = json['label'];
    time = json['time'];
    message = json['message'];
  }
}
