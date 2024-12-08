import 'package:flutter/material.dart';
import 'package:my_spoken_schedules/view/widgets/single_task_widget.dart';
import 'package:my_spoken_schedules/view_model/schedules_view_model.dart';
import 'package:my_spoken_schedules/view_model/task_view_model.dart';
import 'package:provider/provider.dart';

class ScheduleDetailView extends StatelessWidget with ChangeNotifier {
  final ScheduleViewModel scheduleViewModel;

  ScheduleDetailView({Key? key, required this.scheduleViewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    notifyListeners();
    final scheduleViewModel =
        Provider.of<ScheduleViewModel>(context, listen: true);
        // final taskViewModel =
        // Provider.of<ScheduleViewModel>(context, listen: true);
        notifyListeners();
        // scheduleViewModel.refreshTasks();
        // taskViewModel.refreshTasks();
    int taskCount = scheduleViewModel.scheduleModel.tasks?.length ?? 0;
    taskCount++;
    return Scaffold(
      appBar: AppBar(
        title:
            Text(scheduleViewModel.scheduleModel.label ?? 'Schedule Details'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: taskCount,
              itemBuilder: (context, index) {
                notifyListeners();
                // taskViewModel.refreshTasks();
                if (index == taskCount - 1) {
                  debugPrint("taskCount == $taskCount");
                  return ListTile(
                    title: const Text('Add New Task'),
                    trailing: const Icon(Icons.add),
                    onTap: () {
                      scheduleViewModel.addTask();
                    },
                  );
                }
                notifyListeners();
                final task = scheduleViewModel.scheduleModel.tasks![index];
                TaskViewModel(task).refreshTasks();
                return SingleTaskWidget(
                  taskViewModel: TaskViewModel(task),
                  scheduleViewModel: scheduleViewModel,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
