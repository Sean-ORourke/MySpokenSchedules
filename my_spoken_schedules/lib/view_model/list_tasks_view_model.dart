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

    // // this.tasks = ((e) => TasksViewModel(e)).toList();

    // this.tasks = task_model.map((e) => TasksViewModel(e)).toList();; // tasks needs a type of List<TasksViewModel>

    // all I have to do is fill this.tasks with a List<TasksViewModel>

    notifyListeners();
  }
}
