import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PetMart extends StatelessWidget {
  const PetMart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              "Assets/Image/download (9) 3.png",
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 40),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Tips",
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Icon(
                      Icons.pets,
                      color: Colors.black,
                      size: 15,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      "Daily tips to improve your pet's well-being!",
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 25),
                Container(
                    height: 45,
                    width: 236,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40)),
                    child: const TextField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(16),
                          labelText: 'Search',
                          suffixIcon: Icon(Icons.close),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide.none,
                          )),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
