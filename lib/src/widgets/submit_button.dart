import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login_page_flutter/src/core/notification_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Submit extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController userNameController;
  final GlobalKey<FormState> formKey;
  const Submit({
    super.key,
    required this.emailController,
    required this.userNameController,
    required this.formKey,
  });
  Future<void> saveUserData(String email,String username) async {
    try{
      final preferences = await SharedPreferences.getInstance();
      await preferences.setString('username',username );
      await preferences.setString('email', email);
      print("Saved successfully ");
    }catch(e){
       print("Error saving data : $e");
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: ElevatedButton(
        onPressed: () async {
          String email = emailController.text;
          String username=userNameController.text;
           
          if (formKey.currentState!.validate()) {
            await saveUserData(email,username);
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
                      onPressed: () async {
                        Navigator.of(context).pop();
                         await NotificationService.showWelcome(username);
                        context.go('/home');
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
