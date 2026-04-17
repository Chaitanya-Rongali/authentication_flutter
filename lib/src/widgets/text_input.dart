import 'package:flutter/material.dart';
class UserNameWidget extends StatelessWidget {
  final TextEditingController controller;
  const UserNameWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: 'UserName',
      prefixIcon: Icon(Icons.person),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your userName';
    }
    return null; 
  },
    );
  }
}