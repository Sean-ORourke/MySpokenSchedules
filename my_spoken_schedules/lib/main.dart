import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_spoken_schedules/view_model/list_schedules_view_model.dart';
import 'package:my_spoken_schedules/view/list_schedules_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ListSchedulesViewModel())
      ],
      child: MaterialApp(
        home: ScheduleListView(),
      ),
    );
  }
}
