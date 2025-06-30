import 'package:flutter/material.dart';
import 'package:pet_app/Comman/widget/image_widget.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(240, 169, 115, 1),

      body: Column(children: [
        ImageWidget(),
      ],),

    );
  }
}
