import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
class Submit extends StatelessWidget {
   final TextEditingController emailController;
  const Submit({super.key,required this.emailController});

  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.all(28.0),
              child: ElevatedButton(
                onPressed: () {
                   String email = emailController.text;
                   if (kDebugMode) {
                     print('Login successful for user: $email');
                   }
              
                  showDialog(context: context, builder:(BuildContext context){
                    return AlertDialog(
                      title: Text('Login Success'),
                      content: Text('Welcome $email!\nYou have successfully logged in.'),
                      actions:[
                        TextButton(onPressed:(){
                          Navigator.of(context).pop(); 
                        },child: Text('OK'),),
                        
                      ]
                    );
                  });
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