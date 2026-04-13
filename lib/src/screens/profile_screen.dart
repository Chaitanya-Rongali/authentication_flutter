import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
class ProfileScreen extends StatelessWidget {
  final String? email;
 

  const ProfileScreen({super.key, this.email});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Logged in as:\n$email",
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
           ElevatedButton(
            onPressed: () {
              context.go('/');
            },
            child: const Text("Logout"),
          ),
        ]
       
),
    );
  }
}