import 'dart:convert'; // For JSON encoding
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart'; // To save files on device
import 'dart:io'; // For file operations

class TasksDetailsView extends StatefulWidget {
  const TasksDetailsView({super.key});

  static const routeName = '/task';

  @override
  _TasksDetailsViewState createState() => _TasksDetailsViewState();
}

class _TasksDetailsViewState extends State<TasksDetailsView> {
  TimeOfDay? _selectedTime;
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final TextEditingController _labelController = TextEditingController();

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.orange,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.orange,
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

  Future<void> _loadTask() async {
    if (_idController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please provide an ID to load an task.')),
      );
      return;
    }

    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/model/tasks.json');

    if (!await file.exists()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No tasks found.')),
      );
      return;
    }

    final contents = await file.readAsString();
    final tasks = json.decode(contents)['tasks'] as List;

    final existingTask = tasks.firstWhere(
      (task) => task['id'] == _idController.text,
      orElse: () => null,
    );

    if (existingTask != null) {
      setState(() {
        _labelController.text = existingTask['label'] ?? ''; // Load label if present
        _messageController.text = existingTask['message'];
        _selectedTime = _parseTime(existingTask['schedule']['time']);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Task loaded successfully!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Task not found.')),
      );
    }
  }

  TimeOfDay _parseTime(String timeString) {
    final parts = timeString.split(':');
    final hour = int.parse(parts[0]);
    final minute = int.parse(parts[1].split(' ')[0]);
    final period = parts[1].split(' ')[1];

    return TimeOfDay(
      hour: period == 'PM' && hour != 12 ? hour + 12 : hour,
      minute: minute,
    );
  }

  Future<void> _saveTask() async {
    if (_selectedTime == null || _messageController.text.isEmpty || _labelController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please provide both time and message.')),
      );
      return;
    }

    // Create a new Task object
    final newTask = {
      "id": _idController.text.isNotEmpty
          ? _idController.text
          : DateTime.now().millisecondsSinceEpoch.toString(),
      "label": _labelController.text,
      "time": _selectedTime!.format(context),
      "message": _messageController.text,
      "isActive": true
    };

    // Get the local path to save the JSON file
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/model/tasks.json');

    List<dynamic> tasks = [];

    // Read the existing Tasks if the file exists
    if (await file.exists()) {
      final contents = await file.readAsString();
      tasks = json.decode(contents)['tasks'];
    }

    // Add the new Task to the list
    final existingIndex = tasks.indexWhere((task) => task['id'] == newTask['id']);

    if (existingIndex != -1) {
      tasks[existingIndex] = newTask; // Update existing task
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Task updated successfully!')),
      );
    } else {
      tasks.add(newTask); // Add new task
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Task created successfully!')),
      );
    }

    final updatedTasks = json.encode({"tasks": tasks});
    await file.writeAsString(updatedTasks);

    _clearFields();
  }

  void _clearFields() {
    _idController.clear();
    _messageController.clear();
    _labelController.clear();
    setState(() {
      _selectedTime = null;
    });
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
            TextField(
              controller: _idController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'ID (Leave blank to create new task)',
              ),
            ),
            TextField(
              controller: _labelController,
              decoration: const InputDecoration(
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
            const SizedBox(height: 16),
            TextField(
              controller: _messageController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Message',
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: _loadTask,
              child: const Text('Load Task by ID'),
            ),
            ElevatedButton(
              onPressed: _saveTask,
              child: const Text('Save Task'),
            ),
          ],
        ),
      ),
    );
  }
}