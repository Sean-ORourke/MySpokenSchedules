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
import 'package:my_spoken_schedules/service/notification.dart';

// class ScheduleDetailView extends StatelessWidget with ChangeNotifier {
//   final ScheduleViewModel scheduleViewModel;

//   ScheduleDetailView({Key? key, required this.scheduleViewModel})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {

class ScheduleDetailView extends StatefulWidget with ChangeNotifier {
  ListSchedulesViewModel? vm;
  ScheduleViewModel? scheduleViewModel;

  ScheduleDetailView({required this.vm, required this.scheduleViewModel});

  @override
  _ScheduleDetailViewState createState() => _ScheduleDetailViewState();
}

class _ScheduleDetailViewState extends State<ScheduleDetailView> {
  late TextEditingController labelController;
  late TextEditingController daysController;
  late ScheduleViewModel scheduleViewModel;
  late ListSchedulesViewModel vm;

  late bool? isMondayChecked = false;
  late bool? isTuesdayChecked = false;
  late bool? isWednesdayChecked = false;
  late bool? isThursdayChecked = false;
  late bool? isFridayChecked = false;
  late bool? isSaturdayChecked = false;
  late bool? isSundayChecked = false;
  VisualDensity visualDensity =
      const VisualDensity(horizontal: VisualDensity.minimumDensity);

  _ScheduleDetailViewState();

  @override
  void initState() {
    super.initState();
    vm = widget.vm!;
    scheduleViewModel = widget.scheduleViewModel!;
    labelController = TextEditingController(
        text: widget.scheduleViewModel!.scheduleModel?.label);
    daysController = TextEditingController(
        text: widget.scheduleViewModel!.scheduleModel?.days.toString());

    for (int i = 0; i < scheduleViewModel.scheduleModel.days!.length; i++) {
      if (scheduleViewModel.scheduleModel.days![i] == "Monday")
        isMondayChecked = true;
      if (scheduleViewModel.scheduleModel.days![i] == "Tuesday")
        isTuesdayChecked = true;
      if (scheduleViewModel.scheduleModel.days![i] == "Wednesday")
        isWednesdayChecked = true;
      if (scheduleViewModel.scheduleModel.days![i] == "Thursday")
        isThursdayChecked = true;
      if (scheduleViewModel.scheduleModel.days![i] == "Friday")
        isFridayChecked = true;
      if (scheduleViewModel.scheduleModel.days![i] == "Saturday")
        isSaturdayChecked = true;
      if (scheduleViewModel.scheduleModel.days![i] == "Sunday")
        isSundayChecked = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    Text titleText = Text(
        widget.scheduleViewModel!.scheduleModel?.label ?? "Unnamed Schedule");

    final scheduleViewModel =
        Provider.of<ScheduleViewModel>(context, listen: true);
    // final taskViewModel =
    // Provider.of<ScheduleViewModel>(context, listen: true);

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
            padding: const EdgeInsets.all(10.0),
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
                            decoration: const InputDecoration(
                                labelText: 'Schedule Label'),
                            onSaved: (String? labelText) {
                              debugPrint(
                                  "Value for field labelController saved as ${labelController.text}");
                              widget.scheduleViewModel!
                                  .updateLabel(labelController.text);

                              scheduleViewModel.refreshTasks();
                              vm.refreshSchedules();
                              setState(() {
                                titleText = Text(labelController.text);
                              });
                            }),
                        const SizedBox(height: 10.0),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          clipBehavior: Clip.antiAlias,
                          child: Row(
                            children: [
                              const Text("M"),
                              Checkbox(
                                // title: const Text("Monday"),
                                // checkboxSemanticLabel: "Monday",
                                shape: const CircleBorder(),
                                visualDensity: visualDensity,
                                tristate: false,
                                value: isMondayChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isMondayChecked = value;
                                    scheduleViewModel.updateDays(
                                        isMondayChecked!, "Monday");
                                    vm.refreshSchedules();
                                  });
                                },
                              ),
                              const SizedBox(width: 10.0),
                              const Text("Tu"),
                              Checkbox(
                                // title: const Text("Tuesday"),
                                // checkboxSemanticLabel: "Tuesday",
                                shape: const CircleBorder(),
                                visualDensity: visualDensity,
                                tristate: false,
                                value: isTuesdayChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isTuesdayChecked = value;
                                    scheduleViewModel.updateDays(
                                        isTuesdayChecked!, "Tuesday");
                                    vm.refreshSchedules();
                                  });
                                },
                              ),
                              const SizedBox(width: 10.0),
                              const Text("W"),
                              Checkbox(
                                // title: const Text("Tuesday"),
                                // checkboxSemanticLabel: "Tuesday",
                                shape: const CircleBorder(),
                                visualDensity: visualDensity,
                                tristate: false,
                                value: isWednesdayChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isWednesdayChecked = value;
                                    scheduleViewModel.updateDays(
                                        isWednesdayChecked!, "Wednesday");
                                    vm.refreshSchedules();
                                  });
                                },
                              ),
                              const SizedBox(width: 10.0),
                              const Text("Th"),
                              Checkbox(
                                // title: const Text("Tuesday"),
                                // checkboxSemanticLabel: "Tuesday",
                                shape: const CircleBorder(),
                                visualDensity: visualDensity,
                                tristate: false,
                                value: isThursdayChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isThursdayChecked = value;
                                    scheduleViewModel.updateDays(
                                        isThursdayChecked!, "Thursday");
                                    vm.refreshSchedules();
                                  });
                                },
                              ),
                              const SizedBox(width: 10.0),
                              const Text("F"),
                              Checkbox(
                                // title: const Text("Tuesday"),
                                // checkboxSemanticLabel: "Tuesday",
                                shape: const CircleBorder(),
                                visualDensity: visualDensity,
                                tristate: false,
                                value: isFridayChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isFridayChecked = value;
                                    scheduleViewModel.updateDays(
                                        isFridayChecked!, "Friday");
                                    vm.refreshSchedules();
                                  });
                                },
                              ),
                              const SizedBox(width: 10.0),
                              const Text("Sa"),
                              Checkbox(
                                // title: const Text("Tuesday"),
                                // checkboxSemanticLabel: "Tuesday",
                                shape: const CircleBorder(),
                                visualDensity: visualDensity,
                                tristate: false,
                                value: isSaturdayChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isSaturdayChecked = value;
                                    scheduleViewModel.updateDays(
                                        isSaturdayChecked!, "Saturday");
                                    vm.refreshSchedules();
                                  });
                                },
                              ),
                              const SizedBox(width: 10.0),
                              const Text("Su"),
                              Checkbox(
                                // title: const Text("Tuesday"),
                                // checkboxSemanticLabel: "Tuesday",
                                shape: const CircleBorder(),
                                visualDensity: visualDensity,
                                tristate: false,
                                value: isSundayChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isSundayChecked = value;
                                    scheduleViewModel.updateDays(
                                        isSundayChecked!, "Sunday");
                                    vm.refreshSchedules();
                                  });
                                },
                              ),
                            ],
                          ),
                        ),

                        // const SizedBox(height: 10.0),
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
                        // const SizedBox(height: 10.0)
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
                // taskViewModel.refreshTasks();
                if (index == taskCount - 1) {
                  debugPrint("taskCount == $taskCount");
                  return ListTile(
                    title: const Text('Add New Task'),
                    trailing: const Icon(Icons.add),
                    onTap: () {
                      scheduleViewModel.addTask();
                      scheduleViewModel.updateNotifs();
                    },
                  );
                }

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
