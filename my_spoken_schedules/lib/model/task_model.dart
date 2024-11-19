class task_model {

  String? id;
  String? label;
  String? time;
  String? message;
  bool? isActive;

  task_model (
  {this.id,
  this.label,
  this.time,
  this.message,
  this.isActive});

  task_model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    label = json['label'];
    time = json['time'];
    message = json['message'];
    isActive = json['isActive'];
  }

}