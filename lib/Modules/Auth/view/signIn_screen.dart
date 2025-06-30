import 'package:flutter/material.dart';
import 'package:pet_app/Comman/widget/image_widget.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
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
