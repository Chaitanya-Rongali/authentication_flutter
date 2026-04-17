import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login_page_flutter/src/core/app_routes.dart';
import 'package:login_page_flutter/src/core/notification_service.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  await NotificationService.notifications.cancelAll();
  await NotificationService.init((payload) {
    if (payload == 'home') {
      navigatorKey.currentContext?.go('/home');
    } else if (payload == 'profile') {
      navigatorKey.currentContext?.go('/profile');
    }
  });
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}