import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset("Assets/logo/appLogo.png",
      height: 201, width: 166,);
  }
}
