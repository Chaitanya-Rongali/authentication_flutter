import 'package:flutter/material.dart';

class PasswordWidget extends StatelessWidget {
  final TextEditingController controller;
  const PasswordWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: true,
      decoration: InputDecoration(prefixIcon: Icon(Icons.lock),
      labelText: 'Password',
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),),
      validator: (value) {
        if (value == null || value.length < 10) {
          return 'Password must be at least 10 characters';
        }
        return null;
      },
    );
  }
}