import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_app/Modules/Reminder/view/add_reminder.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../Controller/reminder_controller.dart';
import '../widget/toggle.dart';

class ReminderScreen extends StatefulWidget {
  ReminderScreen({super.key});

  @override
  State<ReminderScreen> createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  final ReminderController reminderController = Get.put(ReminderController());
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    reminderController.loadReminders();
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
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                SizedBox(height: 40),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Reminders",
                    style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ),
                SizedBox(height: 18),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Toggle(label: "Calendar", selected: true),
                    Toggle(label: "Overdue", selected: false),
                  ],
                ),

                SizedBox(height: 12),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TableCalendar(
                    focusedDay: _focusedDay,
                    firstDay: DateTime(2020),
                    lastDay: DateTime(2030),
                    selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                      });
                    },
                    calendarStyle: CalendarStyle(
                      outsideDaysVisible: false,
                      todayDecoration: BoxDecoration(
                        color: Colors.orange.shade300,
                        shape: BoxShape.circle,
                      ),
                      selectedDecoration: BoxDecoration(
                        color: Colors.orange,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20),

                ElevatedButton.icon(
                  onPressed: () async {
                    await Get.to(() => AddRemindersScreen());
                    reminderController.loadReminders();
                  },
                  icon: CircleAvatar(
                      radius: 13,
                      backgroundColor: Color.fromRGBO(240, 169, 115, 1),
                      child: Icon(
                        Icons.add,
                        color: Color.fromRGBO(70, 0, 0, 1),
                      )),
                  label: Text(
                    "Add Reminders",
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                  ),
                ),



                // Reminder List
                Obx(() {
                  final reminders = reminderController.reminders;

                  if (reminderController.isLoading.value) {
                    return CircularProgressIndicator();
                  }

                  if (reminders.isEmpty) {
                    return Center(
                      child: Text("No reminders yet.",
                          style: GoogleFonts.poppins(fontSize: 14)),
                    );
                  }

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: reminders.length,
                    itemBuilder: (context, index) {
                      final item = reminders[index];
                      return GestureDetector(
                        onLongPress: () {
                          Get.defaultDialog(
                            title: "Delete Reminder",
                            middleText: "Are you sure you want to delete this reminder?",
                            textCancel: "Cancel",
                            textConfirm: "Delete",
                            confirmTextColor: Colors.white,
                            onConfirm: () {
                              if (item.id != null) {
                                reminderController.deleteReminder(item.id!);
                              }
                              Get.back();
                            },
                          );
                        },
                        child: Container(
                          height: 65,
                          width: 240,
                          margin: EdgeInsets.symmetric( horizontal: 40, vertical: 8),
                          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.pets, color: Colors.orange),
                              SizedBox(width: 19),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${item.date.day} ${_monthName(item.date.month)} ${item.date.year} ${item.time}",
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        letterSpacing: -1,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(item.type,
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w800, fontSize: 14)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                })

              ],
            ),
          ),
        ],
      ),
    );
  }

  String _monthName(int month) {
    const months = [
      '',
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return months[month];
  }
}
