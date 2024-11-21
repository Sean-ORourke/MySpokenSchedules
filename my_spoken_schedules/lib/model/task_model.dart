class task_model {
  String? id;
  String? label;
  String? time;
  String? message;

  task_model({this.id, this.label, this.time, this.message});

  task_model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    label = json['label'];
    time = json['time'];
    message = json['message'];
  }
}
