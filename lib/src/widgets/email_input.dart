import 'package:flutter/material.dart';

class Email extends StatelessWidget {
  final TextEditingController emailController;
  const Email({super.key, required this.emailController});
  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
      width:MediaQuery.of(context).size.width* 0.8,
      child:TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.email),
        iconColor: Colors.blue,
        labelText: 'Email',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    ),
    );
  }
}
