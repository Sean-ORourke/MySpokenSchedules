import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_spoken_schedules/view_model/list_schedules_view_model.dart';
import 'package:my_spoken_schedules/view/list_schedules_view.dart';

import 'package:provider/provider.dart';
import 'package:my_spoken_schedules/view_model/list_schedules_view_model.dart';
import 'package:my_spoken_schedules/view_model/list_tasks_view_model.dart';
import 'package:my_spoken_schedules/view/list_schedules_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ListSchedulesViewModel()),
        ChangeNotifierProvider(create: (_) => ListTasksViewModel()),
      ],
      child: MaterialApp(
        home: ScheduleListView(),
      ),
    );
  }
}









// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:my_spoken_schedules/view/list_tasks_view.dart';
// import 'package:my_spoken_schedules/view_model/list_tasks_view_model.dart';
// import 'package:my_spoken_schedules/view_model/list_schedules_view_model.dart';
// import 'package:my_spoken_schedules/view/list_schedules_view.dart';

// import 'package:provider/provider.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return CupertinoApp(
//       debugShowCheckedModeBanner: true,
//       localizationsDelegates: [
//         DefaultMaterialLocalizations.delegate,
//         DefaultCupertinoLocalizations.delegate,
//         DefaultWidgetsLocalizations.delegate,
//       ],
//       title: 'MySpokenSchedules!',
//       theme: CupertinoThemeData(),
//       home: ChangeNotifierProvider(
//         create: (context) =>
//             ListSchedulesViewModel(), 
//         child: ScheduleListView(),
//       ),
//     );
//   }
// }

// // TaskListView() {}

// // ListTasksViewModel() {
// //   return Text("hello");
// // }
