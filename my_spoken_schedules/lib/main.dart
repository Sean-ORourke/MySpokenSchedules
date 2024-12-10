import 'package:flutter/material.dart';
import 'package:my_spoken_schedules/notification/notification.dart';
import 'package:provider/provider.dart';
import 'package:my_spoken_schedules/view_model/list_schedules_view_model.dart';
import 'package:my_spoken_schedules/view/list_schedules_view.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:flutter_tts/flutter_tts.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.init();
  tz.initializeTimeZones();
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