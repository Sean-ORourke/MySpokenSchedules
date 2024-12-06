import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_spoken_schedules/view_model/task_view_model.dart';

class TaskDetailView extends StatefulWidget {
  // final String taskLabel;
  // final String taskMessage;
  final TaskViewModel? taskViewModel;

  TaskDetailView(
      {// {required this.taskLabel,
      // required this.taskMessage,
      required this.taskViewModel});

  @override
  _TaskDetailViewState createState() => _TaskDetailViewState();
}

class _TaskDetailViewState extends State<TaskDetailView> with ChangeNotifier{
  late TextEditingController labelController;
  late TextEditingController messageController;
  late TaskViewModel taskViewModel;
  TimeOfDay? selectedTime; // Store the selected time

  _TaskDetailViewState();

  @override
  void initState() {
    super.initState();
    taskViewModel = widget.taskViewModel!;
    labelController = TextEditingController(text: widget.taskViewModel!.taskModel?.label);
    messageController = TextEditingController(text: widget.taskViewModel!.taskModel?.message);
  }

/*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.taskLabel),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: labelController,
              decoration: InputDecoration(labelText: 'Task Label'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: messageController,
              decoration: InputDecoration(labelText: 'Task Message'),
            ),
            SizedBox(height: 16.0),
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
                  });
                }
              },
              child: Text(
                selectedTime == null
                    ? 'Select Time' // Default button text
                    : selectedTime!.format(context), // Show selected time
              ),
            ),
            SizedBox(height: 16.0),
            // ElevatedButton(
            //   onPressed: () {
            //     // Add logic to save changes
            //     Navigator.pop(context);
            //   },
            //   child: Text('Save'),
            // ),
          ],
        ),
      ),
    );
  }
  */

  @override
  Widget build(BuildContext context) {

    Text titleText = Text(widget.taskViewModel!.taskModel?.label ?? "Unnamed Task");
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
              },
              child: Column(
                children: [
                  TextFormField(
                      controller: labelController,
                      decoration: InputDecoration(labelText: 'Task Label'),
                      onSaved: (String? labelText) {
                        debugPrint(
                            "Value for field labelController saved as ${labelController.text}");
                        widget.taskViewModel!.updateTask(labelController.text, messageController.text);
                        notifyListeners();
                      }),
                  SizedBox(height: 16.0),
                  TextFormField(
                      controller: messageController,
                      decoration: InputDecoration(labelText: 'Task Message'),
                      onSaved: (String? labelText) {
                        debugPrint(
                            "Value for field messageController saved as ${messageController.text}");
                            widget.taskViewModel!.updateTask(labelController.text, messageController.text);
                            titleText = Text(widget.taskViewModel!.taskModel?.label ?? "task");
                            notifyListeners();
                      }),
                  SizedBox(height: 16.0),
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
                        });
                      }
                    },
                    child: Text(
                      selectedTime == null
                          ? 'Select Time' // Default button text
                          : selectedTime!.format(context), // Show selected time
                    ),
                  ),
                  SizedBox(height: 16.0),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     // Add logic to save changes
                  //     Navigator.pop(context);
                  //   },
                  //   child: Text('Save'),
                  // ),
                ],
              ),

              // child: Wrap(
              //   children: List<Widget>.generate(5, (int index) {
              //     return Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: ConstrainedBox(
              //         constraints: BoxConstraints.tight(const Size(200, 50)),
              //         child: TextFormField(
              //           onSaved: (String? value) {
              //             debugPrint(
              //                 'Value for field $index saved as "$value"');

              //           },
              //         ),
              //       ),
              //     );
              //   }),
              // ),
            ),
          ),
        ),
      ),
      )
    );
  }
}
