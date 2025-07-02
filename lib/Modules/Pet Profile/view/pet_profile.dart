import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_app/Modules/Pet%20Profile/widget/custom_field.dart';
import '../../../Controller/pet_controller.dart';

class PetProfile extends StatefulWidget {
  const PetProfile({super.key});

  @override
  State<PetProfile> createState() => _PetProfileState();
}

class _PetProfileState extends State<PetProfile> {
  final petController = Get.put(PetController());

  @override
  void initState() {
    super.initState();
    petController.loadProfile();
  }

  void _showImagePickerOptions() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.photo),
            title: const Text('Pick from Gallery'),
            onTap: () {
              Navigator.pop(context);
              petController.pickAndUploadImage(true); // true = gallery
            },
          ),
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text('Take a Photo'),
            onTap: () {
              Navigator.pop(context);
              petController.pickAndUploadImage(false); // false = camera
            },
          ),
        ],
      ),
    );
  }

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
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 28.0),
                    child: GestureDetector(
                      onTap: _showImagePickerOptions,
                      child: Obx(() {
                        final imagePath = petController.imageUrl.value;

                        return CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.white,
                          backgroundImage: imagePath.isNotEmpty
                              ? (imagePath.startsWith('http')
                              ? NetworkImage(imagePath)
                              : FileImage(File(imagePath)) as ImageProvider)
                              : null,
                          child: imagePath.isEmpty
                              ? const Icon(Icons.pets, size: 40, color: Colors.grey)
                              : null,
                        );
                      }),
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
                        color: const Color.fromRGBO(79, 45, 39, 1),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  CustomField(controller: petController.nameController, label: 'Name'),
                  CustomField(controller: petController.genderController, label: 'Gender'),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Pet Details",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        color: const Color.fromRGBO(79, 45, 39, 1),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  CustomField(controller: petController.weightController, label: 'Weight'),
                  CustomField(controller: petController.ageController, label: 'Age'),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 59,
                    width: 154,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(243, 120, 29, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      onPressed: () {
                        petController.saveProfile();
                      },
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
          ),
        ],
      ),
    );
  }
}
