// import 'package:flutter/material.dart';
// import 'package:my_spoken_schedules/view/widgets/new_task_widget.dart';
// import 'package:my_spoken_schedules/view/widgets/single_task_widget.dart';
// import 'package:provider/provider.dart';
// import 'package:my_spoken_schedules/view_model/list_tasks_view_model.dart';
// import 'package:my_spoken_schedules/view/widgets/single_task_widget.dart';

// class TaskListView extends StatefulWidget {
//   @override
//   _ListTasksViewState createState() => _ListTasksViewState();
// }

// class _ListTasksViewState extends State<TaskListView> {
//   @override
//   void initState() {
//     super.initState();
//     // Use addPostFrameCallback to ensure fetchTasks() runs after the widget tree is built
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       Provider.of<ListTasksViewModel>(context, listen: false).fetchTasks();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final vm = Provider.of<ListTasksViewModel>(context);

//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Task List'),
//         ),
//         // body: Consumer<ListTasksViewModel>( //avoid?
//         //   builder: (context, listTasksViewModel, child) {
//         //     // Show a loading indicator if tasks are empty
//         //     if (listTasksViewModel.tasks.isEmpty) {
//         //       return Center(child: CircularProgressIndicator());
//         //     }

//         //     // Display the list of tasks
//         body: ListView.builder(
//           itemCount: vm.tasks.length + 1, // +1 ?
//       //     itemBuilder: (context, index) {
            
//       //       if (index == vm.tasks.length) {
//       //   // Render "New Task Widget" at the end
//       //   return NewTaskWidget(
//       //   ); //taskViewModel: taskViewModel);
//       // }
//       //       final taskViewModel = vm.tasks[index];
//       //       return SingleTaskWidget(taskViewModel: taskViewModel); //after the last Single task widget, I want a new task widget: NewTaskWidget(taskViewModel: taskViewModel)
//       //     },
//        itemBuilder: (context, index) {
//       if (index == vm.tasks.length) {
//         // Render the "New Task Widget" at the bottom
//         return NewTaskWidget(
//           onAddTask: () {
//             // Call the addTask method to add a new task to the list
//             vm.addTask();
//           },
//         );
//       }
//       // Render individual task widgets
//       return SingleTaskWidget(taskViewModel: vm.tasks[index], scheduleViewModel: ,);
//     },
//         ));
//   }
// }
