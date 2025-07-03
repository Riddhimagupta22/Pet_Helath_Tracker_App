import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Controller/user_controller.dart';
import '../../Pet Profile/widget/custom_field.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final UserController userController = Get.put(UserController());

  @override
  void initState() {
    super.initState();
    userController.fetchUserFromDB();
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
              userController.pickAndUploadImage(fromGallery: true);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text('Take a Photo'),
            onTap: () {
              userController.pickAndUploadImage(fromGallery: false);
              Navigator.pop(context);
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
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: _showImagePickerOptions,
                    child: Obx(() {
                      final imagePath = userController.imageUrl.value;

                      return CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.white,
                        backgroundImage: imagePath.isNotEmpty
                            ? (imagePath.startsWith('http')
                            ? NetworkImage(imagePath)
                            : FileImage(File(imagePath)) as ImageProvider)
                            : null,
                        child: imagePath.isEmpty
                            ? const Icon(Icons.person, size: 40, color: Colors.grey)
                            : null,
                      );
                    }),
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Owner",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: const Color.fromRGBO(79, 45, 39, 1),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomField(controller: userController.nameController, label: 'Name'),
                  const SizedBox(height: 10),
                  CustomField(controller: userController.genderController, label: 'Gender'),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Owner's Contacts",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: const Color.fromRGBO(79, 45, 39, 1),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomField(controller: userController.emailController, label: 'Email'),
                  const SizedBox(height: 10),
                  CustomField(controller: userController.phoneController, label: 'Phone'),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "City of Residence",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: const Color.fromRGBO(79, 45, 39, 1),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomField(controller: userController.countryController, label: 'Country'),
                  const SizedBox(height: 10),
                  CustomField(controller: userController.cityController, label: 'City'),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Address",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: const Color.fromRGBO(79, 45, 39, 1),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomField(controller: userController.addressController, label: 'Address'),
                  const SizedBox(height: 30),
                  SizedBox(
                    height: 50,
                    width: 154,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(243, 120, 29, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      onPressed: () {
                        userController.updateUser();
                      },
                      child: Text(
                        "Save",
                        style: GoogleFonts.poppins(
                          fontSize: 20,
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
