import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Submit extends StatelessWidget {
  final TextEditingController emailController;
  final GlobalKey<FormState> formKey;
  const Submit({
    super.key,
    required this.emailController,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: ElevatedButton(
        onPressed: () {
          String email = emailController.text;
          if (formKey.currentState!.validate()) {
            print('Login successful for user: $email');
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Login Success'),
                  content: Text(
                    'Welcome $email!\nYou have successfully logged in.',
                  ),
                  actions: [
                    TextButton(
                      child: Text('OK'),
                      onPressed: () {
                        Navigator.of(context);
                        context.go('/home', extra: emailController.text);
                      },
                    ),
                  ],
                );
              },
            );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
        ),
        child: Text(
          'Login',
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
    );
  }
}
