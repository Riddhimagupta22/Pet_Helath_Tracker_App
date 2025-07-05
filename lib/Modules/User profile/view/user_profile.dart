import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_app/Comman/widget/custom_field.dart';
import 'package:pet_app/Controller/user_controller.dart';
import 'package:pet_app/Modules/User%20profile/Widget/heading_widget.dart';

import '../Widget/custom_button.dart';

class UserProfile extends StatefulWidget {
  UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final userController = Get.put(UserController());

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
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  const CircleAvatar(
                    radius: 75,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                      color: Colors.transparent,
                      child: Column(children: [
                        HeadingWidget(label: "Owner"),
                        CustomField(
                          controller: userController.namecontroller,
                          label: 'Name',
                          keyboardType: TextInputType.text,
                        ),
                        CustomField(
                            controller: userController.gendercontroller,
                            keyboardType: TextInputType.text,
                            label: 'Gender'),
                        HeadingWidget(label: "Owner's contacts"),
                        CustomField(
                            controller: userController.Emailcontroller,
                            keyboardType: TextInputType.emailAddress,
                            label: 'Email'),
                        CustomField(
                            controller: userController.Phonecontroller,
                            keyboardType: TextInputType.phone,
                            label: 'Phone'),
                        HeadingWidget(label: "City of residence"),
                        CustomField(
                            keyboardType: TextInputType.text,
                            controller: userController.Countrycontroller,
                            label: 'Country'),
                        CustomField(
                            keyboardType: TextInputType.text,
                            controller: userController.Citycontroller,
                            label: 'City'),
                        HeadingWidget(label: "Address"),
                        CustomField(
                            keyboardType: TextInputType.multiline,
                            controller: userController.AddressController,
                            label: 'Address'),
                        const Padding(
                          padding: EdgeInsets.only(
                              left: 10.0, right: 15, bottom: 18, top: 10),
                          child: custom_button(),
                        )
                      ]))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
