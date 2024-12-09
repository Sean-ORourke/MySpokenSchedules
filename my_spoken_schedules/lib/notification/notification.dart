
import 'package:flutter/cupertino.dart';

import 'dart:io';


import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:my_spoken_schedules/model/task_model.dart';
import 'package:my_spoken_schedules/model/schedule_model.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_tts/flutter_tts.dart';

class NotificationService{

  static Future<void> speakTaskMessage(String message) async {
    final FlutterTts flutterTts = FlutterTts();
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1.0);
    await flutterTts.setVolume(0.8);
    await flutterTts.speak(message);
  }

  static Future<void> onAlarmFired(String taskMessage) async {
    await Future.delayed(Duration(seconds: 8));
    speakTaskMessage(taskMessage); 
  }
  
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static Future<void> onDidReceiveNotificationResponse(NotificationResponse notificationResponse) async {}

  static Future<void> init() async{
    const AndroidInitializationSettings androidInitializationSettings = AndroidInitializationSettings("@mipmap/ic_launcher");

    const InitializationSettings initializationSettings = InitializationSettings(
      android: androidInitializationSettings
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse:onDidReceiveNotificationResponse,
      onDidReceiveBackgroundNotificationResponse: onDidReceiveNotificationResponse);

    await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.requestNotificationsPermission();
  }

  static Future<void> showInstantNotification(String title, String body) async{
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: AndroidNotificationDetails(
        "channelId",
         "channelName",
         importance: Importance.high,
         priority: Priority.high
         )
    );
    await flutterLocalNotificationsPlugin.show(0, title, body, platformChannelSpecifics);
    await onAlarmFired(body);
  }

  static Future<void> scheduleNotification(int id, String title, String body, DateTime scheduledDate) async{
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: AndroidNotificationDetails(
        "channelId",
         "channelName",
         importance: Importance.high,
         priority: Priority.high
         )
    );
    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title, 
      body, 
      tz.TZDateTime.from(scheduledDate, tz.local), 
      platformChannelSpecifics, 
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime, 
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.dateAndTime
    );
    await onAlarmFired(body);

    debugPrint("Notif Created");
  }

  static Future<void> initNotification(TaskModel task, ScheduleModel schedule) async {
    debugPrint("initnotif");
    DateTime now = DateTime.now();
    DateTime scheduledDate = DateTime(now.year, now.month, now.day, task.time?.hour as int, task.time?.minute as int);
    debugPrint(scheduledDate.toString());

    bool isActiveToday = false;

    int today = now.weekday;
    if(task.days != null){
      for (var day in (task.days as List<String>)) {
        if ((today == 1 && day == "Monday") || (today == 2 && day == "Tuesday") || (today == 3 && day == "Wednesday") || (today == 4 && day == "Thursday") || (today == 5 && day == "Friday") || (today == 6 && day == "Saturday") || (today == 7 && day == "Sunday")) {
          isActiveToday = true;          
        }
      } 
    } else {
      debugPrint("DAYS IS NULL");
    }

    if (isActiveToday) {
      NotificationService.cancelNotification(task, schedule);
      NotificationService.scheduleNotification(
        (schedule.id*1000)+task.id,
        task.label as String,
        task.message as String,
        scheduledDate
      );
    }
  }

  static Future<void> cancelNotification(TaskModel task, ScheduleModel schedule) async {
    debugPrint("Notif Canceled");
    await flutterLocalNotificationsPlugin.cancel((schedule.id*1000)+task.id);

  }
}