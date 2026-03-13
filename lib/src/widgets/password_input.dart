import 'package:flutter/material.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({super.key});
 @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width*0.8,
      child: TextFormField(
      decoration: InputDecoration(prefixIcon: Icon(Icons.key),
      labelText:"Password",iconColor:const Color.fromARGB(255, 207, 23, 23),
      border: OutlineInputBorder(borderRadius:BorderRadius.all(Radius.circular(20)))
      ),
      keyboardType:TextInputType.visiblePassword
    ),
    );
  }
}