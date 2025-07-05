import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_app/Modules/Health/Health.dart';

import '../../Controller/vet_controller.dart';

class Heathcare extends StatelessWidget {
  Heathcare({super.key});

  final controller = Get.put(VetVisitController());

  @override
  Widget build(BuildContext context) {
    controller.fetchVetVisits();

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
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const SizedBox(height: 40),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Health Care",
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 18),

                // Vet Visit List
                Obx(() {
                  if (controller.vetVisits.isEmpty) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 280.0),
                      child: Text(
                        "No visits found.",
                        style: GoogleFonts.poppins(fontSize: 16),
                      ),
                    );
                  }

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.vetVisits.length,
                    itemBuilder: (context, index) {
                      final visit = controller.vetVisits[index];
                      return Card(
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          onLongPress: () {
                            Get.defaultDialog(
                              title: "Delete Reminder",
                              middleText:
                                  "Are you sure you want to delete this reminder?",
                              textCancel: "Cancel",
                              textConfirm: "Delete",
                              confirmTextColor: Colors.white,
                              onConfirm: () {
                                if (visit.id != null) {
                                  controller.delete(visit.id!);
                                }
                                Get.back();
                              },
                            );
                          },
                          
                          title: Text("Reason: ${visit.reason}",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold)),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Date: ${visit.date}"),
                              if (visit.notes.isNotEmpty)
                                Text("Notes: ${visit.notes}"),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }),

                Center(
                  child: ElevatedButton.icon(
                    onPressed: () async {
                      await Get.to(() => VetVisit());
                      controller.fetchVetVisits();
                    },
                    icon: const CircleAvatar(
                      radius: 13,
                      backgroundColor: Color.fromRGBO(240, 169, 115, 1),
                      child:
                          Icon(Icons.add, color: Color.fromRGBO(70, 0, 0, 1)),
                    ),
                    label: Text(
                      "Add Visits",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
