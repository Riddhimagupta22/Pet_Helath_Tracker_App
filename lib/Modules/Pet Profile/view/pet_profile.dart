import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_app/Comman/widget/custom_field.dart';
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
              petController.pickAndUploadImage(true);
            },
          ),
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text('Take a Photo'),
            onTap: () {
              Navigator.pop(context);
              petController.pickAndUploadImage(false);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBody: false,
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon((Icons.arrow_back_ios_new))),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color:
                            Color.fromRGBO(243, 120, 29, 1).withOpacity(0.5),
                          ),
                          child: IconButton(
                              onPressed: () {},
                              icon: Center(child: Icon((Icons.logout_rounded),color: Colors.black,))),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 28.0),
                      child: GestureDetector(
                        onTap: _showImagePickerOptions,
                        child: Obx(() {
                          final imagePath = petController.imageUrl.value;

                          return CircleAvatar(
                            radius: 70,
                            backgroundColor: Colors.white,
                            backgroundImage: imagePath.isNotEmpty
                                ? (imagePath.startsWith('http')
                                    ? NetworkImage(imagePath)
                                    : FileImage(File(imagePath)) as ImageProvider)
                                : null,
                            child: imagePath.isEmpty
                                ? const Icon(Icons.pets,
                                    size: 40, color: Colors.grey)
                                : null,
                          );
                        }),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                          child: Column(children: [
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
                        CustomField(
                            controller: petController.nameController,
                            label: 'Name'),
                        CustomField(
                            controller: petController.genderController,
                            label: 'Gender'),
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
                        CustomField(
                            controller: petController.weightController,
                            label: 'Weight'),
                        CustomField(
                            controller: petController.ageController,
                            label: 'Age'),
                        const SizedBox(height: 12),
                        SizedBox(
                          height: 50,
                          width: 154,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromRGBO(243, 120, 29, 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            onPressed: () {
                              petController.saveProfile();
                            },
                            child: Text(
                              "Save",
                              style: GoogleFonts.poppins(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),

                      ])),
                    )
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
