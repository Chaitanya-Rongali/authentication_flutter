import 'package:flutter/cupertino.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Center(
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: const DecorationImage(
              image: AssetImage('assets/logo.jpeg'),
            ),
                    ),
                  child: Image.asset(
                    'assets/logo.jpeg')
                   
                ),
              ),
            );
  }
}