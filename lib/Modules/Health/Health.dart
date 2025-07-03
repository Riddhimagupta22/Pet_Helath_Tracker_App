import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import '../../Controller/vet_controller.dart';

class VetVisit extends StatelessWidget {
  final vetVisitController = Get.put(VetVisitController());

  VetVisit({super.key});

  Future<void> _selectTime(BuildContext context) async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: vetVisitController.selectedTime.value,
    );
    if (pickedTime != null) {
      vetVisitController.selectedTime.value = pickedTime;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF1E6),
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox.expand(
              child: Image.asset(
                "Assets/Image/download (9) 3.png",
                fit: BoxFit.cover,
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: vetVisitController.formKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_back),
                            onPressed: () => Get.back(),
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            "Add Vet Visit",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Obx(() => TableCalendar(
                              firstDay: DateTime.utc(2020, 1, 1),
                              lastDay: DateTime.utc(2030, 12, 31),
                              focusedDay: vetVisitController.selectedDate.value,
                              selectedDayPredicate: (day) => isSameDay(
                                  vetVisitController.selectedDate.value, day),
                              onDaySelected: (selectedDay, focusedDay) {
                                vetVisitController.selectedDate.value =
                                    selectedDay;
                              },
                              headerStyle: const HeaderStyle(
                                formatButtonVisible: false,
                                titleCentered: true,
                              ),
                              calendarStyle: CalendarStyle(
                                outsideDaysVisible: false,
                                todayDecoration: BoxDecoration(
                                  color: Colors.orange[300],
                                  shape: BoxShape.circle,
                                ),
                                selectedDecoration: const BoxDecoration(
                                  color: Colors.orange,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            )),
                      ),
                      const SizedBox(height: 12),

                      // Time Field
                      Obx(() => Container(
                            height: 56,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 4),
                            child: TextFormField(
                              readOnly: true,
                              onTap: () => _selectTime(context),
                              decoration: const InputDecoration(
                                labelText: "Time",
                                border: OutlineInputBorder(),
                              ),
                              controller: TextEditingController(
                                text: DateFormat.jm().format(
                                  DateTime(
                                      0,
                                      0,
                                      0,
                                      vetVisitController
                                          .selectedTime.value.hour,
                                      vetVisitController
                                          .selectedTime.value.minute),
                                ),
                              ),
                            ),
                          )),

                      // Visit Reason
                      Container(
                        height: 56,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 4),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Visit Reason",
                            border: OutlineInputBorder(),
                          ),
                          controller: vetVisitController.reasonController,
                          validator: (value) => value == null || value.isEmpty
                              ? 'Enter reason'
                              : null,
                        ),
                      ),

                      // Notes
                      Container(
                        height: 78,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 4),
                        child: TextFormField(
                          maxLines: 3,
                          decoration: const InputDecoration(
                            labelText: "Notes",
                            border: OutlineInputBorder(),
                          ),
                          controller: vetVisitController.notesController,
                        ),
                      ),
                      SizedBox(height: 15),

                      // Buttons
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: 40,
                              width: 125,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromRGBO(243, 120, 29, 1),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                                onPressed: () {
                                  Get.back();
                                  vetVisitController.saveVisit();
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
                            SizedBox(
                              height: 40,
                              width: 125,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromRGBO(243, 120, 29, 1),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                                onPressed: () {
                                  vetVisitController.clearFields();
                                  Get.back();
                                },
                                child: Text(
                                  "Cancel",
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
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
