import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_spoken_schedules/view/widgets/single_task_widget.dart';
import 'package:my_spoken_schedules/view_model/list_schedules_view_model.dart';
import 'package:my_spoken_schedules/view_model/schedules_view_model.dart';
import 'package:my_spoken_schedules/view_model/task_view_model.dart';
import 'package:provider/provider.dart';
    import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_spoken_schedules/view_model/schedules_view_model.dart';
import 'package:my_spoken_schedules/view_model/task_view_model.dart';
import 'package:my_spoken_schedules/notification/notification.dart';

// class ScheduleDetailView extends StatelessWidget with ChangeNotifier {
//   final ScheduleViewModel scheduleViewModel;

//   ScheduleDetailView({Key? key, required this.scheduleViewModel})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {



class ScheduleDetailView extends StatefulWidget with ChangeNotifier {
  ListSchedulesViewModel? vm;
  ScheduleViewModel? scheduleViewModel;

  ScheduleDetailView(
      { required this.vm,
      required this.scheduleViewModel});

  @override
  _ScheduleDetailViewState createState() => _ScheduleDetailViewState();
}

class _ScheduleDetailViewState extends State<ScheduleDetailView> with ChangeNotifier {
  late TextEditingController labelController;
  late TextEditingController daysController;
  late ScheduleViewModel scheduleViewModel;
  late ListSchedulesViewModel vm;
  // TimeOfDay? selectedTime; // Store the selected time

  _ScheduleDetailViewState();

  @override
  void initState() {
    super.initState();
    vm = widget.vm!;
    scheduleViewModel = widget.scheduleViewModel!;
    labelController = TextEditingController(text: widget.scheduleViewModel!.scheduleModel?.label);
    daysController = TextEditingController(text: widget.scheduleViewModel!.scheduleModel?.days.toString());
  }

  @override
  Widget build(BuildContext context) {

    Text titleText = Text(widget.scheduleViewModel!.scheduleModel?.label ?? "Unnamed Schedule");
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
          Padding(
        padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Shortcuts(
          shortcuts: const <ShortcutActivator, Intent>{
            // Pressing space in the field will now move to the next field.
            SingleActivator(LogicalKeyboardKey.enter): NextFocusIntent(),
          },
          child: FocusTraversalGroup(
            child: Form(
              autovalidateMode: AutovalidateMode.always,
              onChanged: () {
                Form.of(primaryFocus!.context!).save();
                titleText = Text(labelController.text);
              },
              child: Column(
                children: [
                  TextFormField(
                      controller: labelController,
                      decoration: const InputDecoration(labelText: 'Task Label'),
                      onSaved: (String? labelText) {
                        debugPrint(
                            "Value for field labelController saved as ${labelController.text}");
                        widget.scheduleViewModel!.updateLabel(labelController.text);
                        notifyListeners();
                        scheduleViewModel.refreshTasks();
                        vm.refreshSchedules();
                        setState(() {
                          titleText = Text(labelController.text);
                        });
                        

                      }),
                  const SizedBox(height: 16.0),
                  // TextFormField(
                  //     controller: messageController,
                  //     decoration: const InputDecoration(labelText: 'Task Message'),
                  //     onSaved: (String? labelText) {
                  //       debugPrint(
                  //           "Value for field messageController saved as ${messageController.text}");
                  //           widget.taskViewModel!.updateMessage(messageController.text);
                  //           titleText = Text(widget.taskViewModel!.taskModel?.label ?? "task");
                  //           scheduleViewModel.refreshTasks();
                  //     }),
                  const SizedBox(height: 16.0)
                ],
              ),
            ),
          ),
        ),
      ),
      ),
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
                TaskViewModel(task).refreshTask();
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
