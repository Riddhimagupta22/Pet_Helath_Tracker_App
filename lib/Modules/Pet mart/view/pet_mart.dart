import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Widget/card.dart';

class PetMart extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {
      "title": "Basic Commands",
      "image": "Assets/Image/Card/Card1.png",
    },
    {
      "title": "Choosing Pet Food",
      "image":
          "Assets/Image/Card/Card2.png",
    },
    {
      "title": "Pet-Proofing",
      "image":
          "Assets/Image/Card/Card3.png",
    },
    {
      "title": "Exercise Needs",
      "image":
          "Assets/Image/Card/Card4.png",
    },
    {
      "title": "Stress Signs",
      "image":
          "Assets/Image/Card/Card5.png",
    },
    {
      "title": "Vet Visits",
      "image": "Assets/Image/Card/Card6.png",
    },
    {
      "title": "Common Allergies",
      "image": "Assets/Image/Card/Card7.png",
    },
    {
      "title": "Best Treats",
      "image":
          "Assets/Image/Card/Card8.png",
    },
  ];

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
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
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
                    )),
                const SizedBox(height: 5),
                Expanded(
                    child: GridView.builder(
                  itemCount: categories.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 3.75 / 3.5,
                      crossAxisSpacing: 50,
                      mainAxisSpacing: 50),
                  itemBuilder: (BuildContext context, int index) {
                    final category = categories[index];
                    return card(
                        title: category['title'],
                        imagepath: category['image'],
                        onTap: () {});
                  },
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
