import 'package:flutter/material.dart';
import 'package:login_page_flutter/src/core/app_routes.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
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