import 'package:flutter/material.dart';

class TasksDetailsView extends StatefulWidget {
  const TasksDetailsView({super.key});

  static const routeName = '/task';

  @override
  _TasksDetailsViewState createState() => _TasksDetailsViewState();
}

class _TasksDetailsViewState extends State<TasksDetailsView> {
  TimeOfDay? _selectedTime;

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.orange, // Header background and selected time
              onPrimary: Colors.white, // Header text color
              onSurface: Colors.black, // Text color for time options
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.orange, // Button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Details'),
      ),
      body: Center(
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Label',
              ),
            ),
            ElevatedButton(
              onPressed: () => _selectTime(context),
              child: Text(
                _selectedTime == null
                    ? 'Select Time'
                    : 'Selected Time: ${_selectedTime!.format(context)}',
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Message',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
