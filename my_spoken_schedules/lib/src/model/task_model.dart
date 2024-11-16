class task_model {

  String? id;
  String? time;
  String? message;
  bool? isActive;

  task_model (
  {this.id,
  this.time,
  this.message,
  this.isActive});

  task_model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    time = json['time'];
    message = json['message'];
    isActive = json['isActive'];
  }

}