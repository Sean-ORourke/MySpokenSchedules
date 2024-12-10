import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_spoken_schedules/model/task_model.dart';
import 'package:my_spoken_schedules/view_model/schedules_view_model.dart';
import 'package:my_spoken_schedules/view_model/task_view_model.dart';
import 'package:my_spoken_schedules/notification/notification.dart';

class TaskDetailView extends StatefulWidget {
  TaskViewModel? taskViewModel;
  ScheduleViewModel? scheduleViewModel;

  TaskDetailView(
      {required this.taskViewModel, required this.scheduleViewModel});

  @override
  _TaskDetailViewState createState() => _TaskDetailViewState();
}

class _TaskDetailViewState extends State<TaskDetailView> {
  late TextEditingController labelController;
  late TextEditingController messageController;
  late TaskViewModel taskViewModel;
  late ScheduleViewModel scheduleViewModel;
  TimeOfDay? selectedTime; // Store the selected time

  _TaskDetailViewState();

  @override
  void initState() {
    super.initState();
    taskViewModel = widget.taskViewModel!;
    scheduleViewModel = widget.scheduleViewModel!;
    labelController =
        TextEditingController(text: widget.taskViewModel!.taskModel?.label);
    messageController =
        TextEditingController(text: widget.taskViewModel!.taskModel?.message);
  }

  @override
  Widget build(BuildContext context) {
    Text titleText =
        Text(widget.taskViewModel!.taskModel?.label ?? "Unnamed Task");
    return Scaffold(
        appBar: AppBar(
          title: titleText,
        ),
        body: Padding(
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
                          decoration:
                              const InputDecoration(labelText: 'Task Label'),
                          onSaved: (String? labelText) {
                            debugPrint(
                                "Value for field labelController saved as ${labelController.text}");
                            widget.taskViewModel!
                                .updateLabel(labelController.text);
                            NotificationService.initNotification(widget.taskViewModel!.taskModel as TaskModel, scheduleViewModel.scheduleModel);
                            scheduleViewModel.refreshTasks();
                            setState(() {
                              titleText = Text(labelController.text);
                            });
                          }),
                      const SizedBox(height: 16.0),
                      TextFormField(
                          controller: messageController,
                          decoration:
                              const InputDecoration(labelText: 'Task Message'),
                          onSaved: (String? labelText) {
                            debugPrint(
                                "Value for field messageController saved as ${messageController.text}");
                            widget.taskViewModel!
                                .updateMessage(messageController.text);
                            NotificationService.initNotification(widget.taskViewModel!.taskModel as TaskModel, scheduleViewModel.scheduleModel);
                            titleText = Text(
                                widget.taskViewModel!.taskModel?.label ??
                                    "task");
                            scheduleViewModel.refreshTasks();
                          }),
                      const SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: () async {
                          // Show the time picker dialog
                          TimeOfDay? pickedTime = await showTimePicker(
                            context: context,
                            initialTime: selectedTime ?? TimeOfDay.now(),
                            builder: (context, child) {
                              return MediaQuery(
                                data: MediaQuery.of(context)
                                    .copyWith(alwaysUse24HourFormat: false),
                                child: child!,
                              );
                            },
                          );

                          // Update the selected time if the user picked a time
                          if (pickedTime != null) {
                            setState(() {
                              selectedTime = pickedTime;
                              widget.taskViewModel!.updateTime(pickedTime);
                              NotificationService.initNotification(widget.taskViewModel!.taskModel as TaskModel, scheduleViewModel.scheduleModel);
                              scheduleViewModel.refreshTasks();
                            });
                          }
                        },
                        child: Text(
                          selectedTime == null
                              ? widget.taskViewModel!.taskModel?.time!
                                      .format(context) ??
                                  "Select Time" // Default button text
                              : selectedTime!
                                  .format(context), // Show selected time
                        ),
                      ),
                      
                  ],
                ),
              ),
            ),
          ),
        ),
      )
    );
  }
}
