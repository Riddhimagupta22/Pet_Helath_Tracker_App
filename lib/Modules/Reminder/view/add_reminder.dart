import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../Controller/reminder_controller.dart';



class AddRemindersScreen extends StatelessWidget {
  final reminderController = Get.put(ReminderController());

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: reminderController.selectedTime.value,
    );
    if (picked != null && picked != reminderController.selectedTime.value) {
      reminderController.selectedTime.value = picked;
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
                  key: reminderController.reminderFormKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.arrow_back),
                            onPressed: () => Get.back(),
                          ),
                          SizedBox(width: 8),
                          Text(
                            "Add Reminders",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0, left: 16, right: 16),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Obx(() => TableCalendar(
                            firstDay: DateTime.utc(2020, 1, 1),
                            lastDay: DateTime.utc(2030, 12, 31),
                            focusedDay: reminderController.selectedDate.value,
                            selectedDayPredicate: (day) =>
                                isSameDay(reminderController.selectedDate.value, day),
                            onDaySelected: (selectedDay, focusedDay) {
                              reminderController.selectedDate.value = selectedDay;
                            },
                            headerStyle: HeaderStyle(
                              formatButtonVisible: false,
                              titleCentered: true,
                            ),
                            calendarStyle: CalendarStyle(
                              outsideDaysVisible: false,
                              todayDecoration: BoxDecoration(
                                color: Colors.orange[300],
                                shape: BoxShape.circle,
                              ),
                              selectedDecoration: BoxDecoration(
                                color: Colors.orange,
                                shape: BoxShape.circle,
                              ),
                            ),
                          )),
                        ),
                      ),

                      // Time Field
                      Obx(() => Container(
                        height: 56,
                        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        child: TextFormField(
                          readOnly: true,
                          onTap: () => _selectTime(context),
                          decoration: InputDecoration(
                            labelText: "Time",
                            border: OutlineInputBorder(),
                          ),
                          controller: TextEditingController(
                            text:
                            "${reminderController.selectedTime.value.hourOfPeriod}:${reminderController.selectedTime.value.minute.toString().padLeft(2, '0')} ${reminderController.selectedTime.value.period == DayPeriod.am ? 'AM' : 'PM'}",
                          ),
                        ),
                      )),

                      // Reminder Type
                      Container(
                        height: 56,
                        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: "Reminder Type",
                            border: OutlineInputBorder(),
                          ),
                          controller: reminderController.reminderTypeController,
                          validator: reminderController.validateReminderType,
                        ),
                      ),

                      // Notes
                      Container(
                        height: 78,
                        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        child: TextFormField(
                          maxLines: 3,
                          decoration: InputDecoration(
                            labelText: "Notes",
                            border: OutlineInputBorder(),
                          ),
                          controller: reminderController.notesController,
                          validator: reminderController.validateNotes,
                        ),
                      ),

                      // Buttons
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: 40,
                              width: 125,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromRGBO(243, 120, 29, 1),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                                onPressed: () => reminderController.saveReminder(context),
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
                                  backgroundColor: const Color.fromRGBO(243, 120, 29, 1),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                                onPressed: () {
                                  reminderController.reminderTypeController.clear();
                                  reminderController.notesController.clear();
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
