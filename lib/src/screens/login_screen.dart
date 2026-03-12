import 'package:flutter/material.dart';
import 'package:login_page_flutter/src/widgets/email_input.dart';
import 'package:login_page_flutter/src/widgets/logo_widget.dart';
import 'package:login_page_flutter/src/widgets/password_input.dart';
import 'package:login_page_flutter/src/widgets/submit_button.dart';
class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}
class _LoginState extends State<Login> {
   final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text("Login"),
      backgroundColor: const Color.fromRGBO(111, 0, 255, 1),
      foregroundColor: Colors.white,
      leading: Icon(Icons.menu),
       actions:<Widget> [
        Padding(padding:EdgeInsets.only(right:20),
          child: Icon(Icons.search,size: 26,),
        ),Padding(padding: EdgeInsets.only(right:20),
        child:Icon(Icons.more_vert,size:26))
      ],
    ),
    body:Center(
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Logo(),
        SizedBox(height: 30),
        Email(emailController: emailController),
        SizedBox(height: 30),
        PasswordInput(),
        SizedBox(height: 30),
        Submit(emailController: emailController)
        ],
      )
    )
    );
  }
}
