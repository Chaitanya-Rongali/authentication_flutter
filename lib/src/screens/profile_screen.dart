import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String? email;
 

  const ProfileScreen({super.key, this.email});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Logged in as:\n$email",
        textAlign: TextAlign.center,
),
    );
  }
}