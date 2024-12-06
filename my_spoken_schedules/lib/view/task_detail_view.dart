import 'package:flutter/material.dart';

class TaskDetailView extends StatefulWidget {
  final String taskLabel;
  final String taskMessage;

  TaskDetailView ({required this.taskLabel, required this.taskMessage});


  @override
  _TaskDetailViewState createState() => _TaskDetailViewState();

}

  

  class _TaskDetailViewState extends State<TaskDetailView> {

    late TextEditingController labelController;
    late TextEditingController messageController;
    TimeOfDay? selectedTime; // Store the selected time


  @override
  void initState() {
    super.initState();
    labelController = TextEditingController(text: widget.taskLabel);
    messageController = TextEditingController(text: widget.taskMessage);
  }




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
}
