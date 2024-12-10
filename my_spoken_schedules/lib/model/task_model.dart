import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskModel {
  late int id;
  String? label;
  List<String>? days;
  TimeOfDay? time;
  String? message;

  TaskModel({required this.id, this.label, List<String>? this.days, this.time, this.message});

  TaskModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    label = json['label'];
    days = List<String>.from(json['days'] ?? []);
    time = json['time'];
    message = json['message'];
    debugPrint("hello");
  }
    
}

