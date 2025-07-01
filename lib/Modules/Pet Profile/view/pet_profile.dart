import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_app/Modules/Pet%20Profile/widget/custom_field.dart';

class PetProfile extends StatefulWidget {
  const PetProfile({super.key});

  @override
  State<PetProfile> createState() => _PetProfileState();
}

class _PetProfileState extends State<PetProfile> {
  final _nameController =   TextEditingController();
  final _genderController =   TextEditingController();
  final _weightController =   TextEditingController();
  final _ageController =   TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Stack(
          children: [
            SizedBox.expand(
              child: Image.asset(
                "Assets/Image/download (9) 3.png",
                fit: BoxFit.cover,
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 28.0),
                      child: const CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Pet",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          color: Color.fromRGBO(79, 45, 39, 1),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    CustomField(controller: _nameController, label: 'Name'),
                    CustomField(controller: _genderController, label: 'Gender'),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Pet Details",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          color: Color.fromRGBO(79, 45, 39, 1),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    CustomField(controller: _weightController, label: 'Weight'),
                    CustomField(controller: _ageController, label: 'Age'),
                    const SizedBox(height: 12),

                    SizedBox(
                      height: 59,
                      width: 154,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                          Color.fromRGBO(243, 120, 29, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Edit",
                          style: GoogleFonts.poppins(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );}
}
