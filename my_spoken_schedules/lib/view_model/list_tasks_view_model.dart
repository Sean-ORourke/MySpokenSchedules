import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:my_spoken_schedules/model/task_model.dart';

import 'package:my_spoken_schedules/view_model/tasks_view_model.dart';
import 'package:provider/provider.dart';

class ListTasksViewModel extends ChangeNotifier {
  List<TasksViewModel> tasks = <TasksViewModel>[];

  int latestID = 4;

  fetchTasks() {
    // final json = task_model as List<dynamic>;

    // final taskList = json.map((e) => task_model.fromJson(e)).toList();

    // this.tasks = ((e) => TasksViewModel(e)).toList();

    // this.tasks = task_model.map((e) => TasksViewModel(e)).toList(); // tasks needs a type of List<TasksViewModel>

    // this.tasks.add(task_model);

    final List<dynamic> json = [
      {
        "id": "1",
        "label": "Wake Up",
        "message": "Class is in 1 hour."
      },
      {
        "id": "2",
        "label": "Workout",
        "message": "Workout Plan: Run, bike, lift weights."
      },
      {
        "id": "3",
        "label": "take Meds",
        "message": "ibuprofein, excedrin migrane, testosterone, multivitamin",
      },
      {
        "id": "4",
        "label": "time for skincare routine",
        "message": "mondays are sugar scrub, hydrophillic acid, and face lotion",
      }
    ];

    // Parse JSON into TaskModel objects
    final taskList = json
        .map((task) => task_model(
            id: task["id"], label: task["label"], message: task["message"]))
        .toList();

    // Map TaskModel to TasksViewModel
    this.tasks = taskList.map((task) => TasksViewModel(task)).toList();

    // all I have to do is fill this.tasks with a List<TasksViewModel>

    notifyListeners();
  }

  removeTasks(String id) {
    // for (final item in tasks) {
    //   TasksViewModel curr = item;

    //   if (curr.taskModel!.id == id) {
    //     tasks.remove(curr);
    //   }
    // }

    tasks.removeWhere((task) => task.taskModel?.id == id);

    notifyListeners();
  }

  addTask() {
    final newJson = {
      "id": latestID.toString(),
      "label": "New Task",
      "message": "New Message"
    };

    final newTask = task_model(
      id: newJson["id"],
      label: newJson["label"],
      message: newJson["message"]
    ); //newJson.map((task) => task_model(id: task["id"], label: task["label"], message: task["message"]));

    final newTaskViewModel = TasksViewModel(newTask);

    tasks.add(newTaskViewModel);

    latestID++;

    notifyListeners();
  }
}
