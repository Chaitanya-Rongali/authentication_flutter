import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;
class NotificationService {
  static final notifications = FlutterLocalNotificationsPlugin();

  static Future<void> init(Function(String?) onTap) async {
     tzdata.initializeTimeZones();
     tz.setLocalLocation(tz.getLocation('Asia/Kolkata'));
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');

    const settings = InitializationSettings(android: android);

    await notifications.initialize(
      settings,
      onDidReceiveNotificationResponse: (response) {
        onTap(response.payload);
      },
    );
    await notifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
  }

  
  static Future<void> showWelcome(String username) async {
    await notifications.show(
      0,
      "Welcome back",
      "Welcome back $username",
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'welcome_channel',
          'Welcome Notifications',
          importance: Importance.max,
          priority: Priority.high,
        ),
      ),
      payload: 'home', 
    );
  }

  
  static Future<void> scheduleReminder() async {
   final scheduledTime = tz.TZDateTime.now(tz.local).add(const Duration(seconds: 30));
    await notifications.zonedSchedule(
      1,
      "Reminder",
      "Time to check your profile!",
      scheduledTime,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'reminder_channel',
          'Reminder Notifications',
          importance: Importance.max,
          priority: Priority.high,
        ),
      ),
      payload: 'profile', 
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  static Future<List<PendingNotificationRequest>> pending() async {
    return notifications.pendingNotificationRequests();
  }
}