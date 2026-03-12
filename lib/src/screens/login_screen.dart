import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text("Login page"),
      backgroundColor: const Color.fromRGBO(111, 0, 255, 1),
      foregroundColor: Colors.white,
      leading: Icon(Icons.menu)
    ),
    );
  }
}