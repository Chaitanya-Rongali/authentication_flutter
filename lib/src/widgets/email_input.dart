import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
class EmailWidget extends StatelessWidget {
  final TextEditingController controller;
  const EmailWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: 'Email',
      prefixIcon: Icon(Icons.email),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null; 
  },
    );
  }
}