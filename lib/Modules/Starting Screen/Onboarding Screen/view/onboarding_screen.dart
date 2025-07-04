import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_app/Modules/Auth/view/signIn_screen.dart';
import 'package:pet_app/Modules/Starting%20Screen/Onboarding%20Screen/widget/data.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final _controller = PageController();
  int _currentIndex = 0;

  final List onBoardingData = [
    onBoardModel(
        imagePath: "Assets/Image/onBoarding(1).png",
        title: 'Never forget your pet’s needs!',
        subtitle: "Set feeding, walking and vet reminders easily."),
    onBoardModel(
        imagePath: "Assets/Image/onBoarding(2).png",
        title: 'Track your pet’s health effortlessly!',
        subtitle: "Monitor vaccinations, vet visits, and medical records."),
    onBoardModel(
        imagePath: "Assets/Image/onBoarding(3).png",
        title: 'Get Pet Care Tips!',
        subtitle:
            "Join a community of pet lovers, share experiences, and learn the best pet care practices."),
  ];

  void _nextPage() {
    if (_currentIndex < onBoardingData.length - 1) {
      _controller.nextPage(
          duration: const Duration(milliseconds: 400), curve: Curves.ease);
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _controller,
        itemCount: onBoardingData.length,
        onPageChanged: (index) => setState(() => _currentIndex = index),
        itemBuilder: (context, index) {
          final page = onBoardingData[index];
          return Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                page.imagePath,
                fit: BoxFit.cover,
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 161.0),
                    child: Image.asset(
                      "Assets/logo/appLogo.png",
                      height: 201,
                      width: 166,
                    ),
                  ),
                  Text(
                    page.title,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: Colors.white,
                        height: -1),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Text(
                      page.subtitle,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    height: 39,
                    width: 129,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_currentIndex == onBoardingData.length - 1) {
                          Get.off(SigninScreen());
                        } else {
                          _nextPage();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(0, 0, 0, 0.25),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        _currentIndex == onBoardingData.length - 1
                            ? 'Get Started'
                            : 'Next',
                        style: GoogleFonts.jomhuria(
                          fontWeight: FontWeight.w400,
                          fontSize: 25,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              
              Positioned(
                bottom: 10,
                right: 10,
                child: TextButton(
                  onPressed: () {
                    Get.off(SigninScreen());
                  },
                  child: Row(
                    children: [
                      Text(
                        'Skip',
                        style: GoogleFonts.jost(
                          fontWeight: FontWeight.w400,
                          fontSize: 22,
                          color: Colors.white,
                        ),
                      ),
                      Icon(
                        Icons.arrow_right,
                        size: 22,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
              
              Positioned(
                bottom: 30,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    onBoardingData.length,
                    (i) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: _currentIndex == i ? 12 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: _currentIndex == i
                            ? Colors.white
                            : const Color.fromRGBO(178, 47, 47, 1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
