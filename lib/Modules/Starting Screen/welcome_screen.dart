import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Onboarding Screen/view/onboarding_screen.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Get.off(OnBoarding());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body:
        Stack(
          fit: StackFit.expand,
          children: [
            Image.asset("Assets/Image/Picture.png",fit: BoxFit.cover,),
            
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 1,sigmaY: 1
              ),
              child: Container(
                color: Colors.black.withOpacity(0.5),
            ),),
            
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Welcome To",style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 45,
                    color: Colors.white,
                    height: 1
                  ),),
                  SizedBox(height: 30),
                  Image.asset("Assets/logo/appLogo.png",
                    height: 201, width: 166,)

                ],
              ),
            )
            
          ],
        )
        );
  }
}
