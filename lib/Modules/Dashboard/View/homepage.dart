import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_app/Comman/widget/image_widget.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          "Assets/logo/appLogo.png",
          height: 92,
          width: 80,
        ),
        backgroundColor: Color.fromRGBO(243, 120, 29, 1),
        title: Text(
          "HppyPaws",
          style: GoogleFonts.poppins(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        actions: [
          Image.asset(
            "Assets/Icon/Notifications.png",
            height: 31,
            width: 23,
          ),
          SizedBox(
            width: 20,
          ),
          Image.asset(
            "Assets/Icon/User.png",
            height: 31,
            width: 23,
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
              color: Colors.white,
              child: Row(
                children: [
                  Image.asset("Assets/Image/community 1.png",
                      height: 215, width: 225),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "We have our own community...",
                          softWrap: true,
                          style: GoogleFonts.poppins(
                            color: Color.fromRGBO(243, 120, 29, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(243, 120, 29, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            "Explore More",
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
