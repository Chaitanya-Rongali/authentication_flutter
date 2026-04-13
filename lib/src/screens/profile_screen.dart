import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

   @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}
class _ProfileScreenState extends State<ProfileScreen> {
  String? email;
  String? username;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  void loadUser() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      email = prefs.getString('email');
      username = prefs.getString('username');
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    final displayEmail = email ?? 'Not available';
    final displayUsername = username ?? 'Not available';
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.person, size: 80),
          const SizedBox(height: 20),
            Text('Username: $displayUsername'),
            const SizedBox(height: 20),
            Text('Email: $displayEmail'),
           const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              final prefs = await SharedPreferences.getInstance();
              await prefs.clear();
              context.go('/');
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}