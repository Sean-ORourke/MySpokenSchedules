import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:my_spoken_schedules/model/task_model.dart';

import 'package:my_spoken_schedules/view_model/tasks_view_model.dart';
import 'package:provider/provider.dart';

class ListTasksViewModel extends ChangeNotifier {
  List<TasksViewModel> tasks = <TasksViewModel>[];

  fetchTasks() {
    // final json = task_model as List<dynamic>;

    // final taskList = json.map((e) => task_model.fromJson(e)).toList();

    // this.tasks = ((e) => TasksViewModel(e)).toList();

    // this.tasks = task_model.map((e) => TasksViewModel(e)).toList(); // tasks needs a type of List<TasksViewModel>

    // this.tasks.add(task_model);

    final List<dynamic> json = [
      {
        "label": "Task 1 YEAHHHHHHHHHHHHHHHHHHHHH",
        "message": "Message 1 WOOOOOO"
      },
      {
        "label": "Task 2 YAYAYAYAYAYAYAYAYYAYAY",
        "message": "run, bike, lift weights"
      },
      {
        "label": "Task 3 take Meds",
        "message": "ibuprofein, excedrin migrane, testosterone, multivitamin",
      }
    ];

    // Parse JSON into TaskModel objects
    final taskList = json
        .map((e) => task_model(label: e["label"], message: e["message"]))
        .toList();

    // Map TaskModel to TasksViewModel
    this.tasks = taskList.map((task) => TasksViewModel(task)).toList();

    // all I have to do is fill this.tasks with a List<TasksViewModel>

    notifyListeners();
  }
}
