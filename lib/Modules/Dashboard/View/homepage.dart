import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_app/Modules/Health/heathcare.dart';
import 'package:pet_app/Modules/Reminder/view/reminder.dart';
import 'package:pet_app/Modules/Dashboard/Widget/card_widget.dart';

import '../../User profile/view/user_profile.dart';
import '../Pet mart/view/pet_mart.dart';
import '../Widget/custom_container.dart';

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
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              "Assets/Icon/Notifications.png",
              height: 31,
              width: 23,
            ),
          ),
          IconButton(
            onPressed: () {
              Get.to(UserProfile());
            },
            icon: Image.asset(
              "Assets/Icon/User.png",
              height: 31,
              width: 23,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              "Assets/Image/download (11) 1.png",
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              NewWidget(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                // reminder
                child: CardWidget(
                    onTap: () {
                      Get.to(ReminderScreen());
                    },
                    image: "Assets/Icon/Callender Icon.png",
                    title: "Upcoming Reminders",
                    subtitle: "Today's feeding,\nwalking, and vet visits."),
              ),
              // vet visit
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CardWidget(
                    onTap: () {
                      Get.to(Heathcare());
                    },
                    image: "Assets/Icon/Group.png",
                    title: "Pet Health Summary",
                    subtitle: "Overview of pet\nwellness.."),
              ),
              // mart
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CardWidget(
                    onTap: () {
                      Get.to(PetMart());
                    },
                    image: "Assets/Icon/caticon.png",
                    title: "Pet Mart",
                    subtitle:
                        "Daily advice on pet health,\ntraining, and nutrition."),
              ),
              SizedBox(height: 1),
            ],
          ),
        ],
      ),
    );
  }
}
