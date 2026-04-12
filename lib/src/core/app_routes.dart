import 'package:go_router/go_router.dart';
import 'package:login_page_flutter/src/screens/Main_screen.dart';
import 'package:login_page_flutter/src/screens/home_screen.dart';
import 'package:login_page_flutter/src/screens/login_screen.dart';
import 'package:login_page_flutter/src/screens/profile_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const Login()),
    ShellRoute(
      builder: (context, state, child) {
        return MainScreen(child: child);
      },
      routes: [
        GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
        GoRoute(
          path: '/profile',
          builder: (context, state) =>
              ProfileScreen(email: state.extra as String?),
        ),
      ],
    ),
  ],
);
