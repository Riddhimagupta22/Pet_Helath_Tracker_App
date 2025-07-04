import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Models/remainder_model.dart';
import '../Services/remainder_service.dart';

class ReminderController extends GetxController {
  final reminderFormKey = GlobalKey<FormState>();

  final reminderTypeController = TextEditingController();
  final notesController = TextEditingController();
  final selectedDate = DateTime.now().obs;
  final selectedTime = TimeOfDay.now().obs;

  final isLoading = false.obs;
  final reminders = <Reminder>[].obs;

  final ReminderService _reminderService = ReminderService();

  String? validateReminderType(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter a reminder type';
    }
    return null;
  }

  String? validateNotes(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter notes';
    }
    return null;
  }

  Future<void> saveReminder(BuildContext context) async {
    if (reminderFormKey.currentState!.validate()) {
      isLoading.value = true;

     final hour = selectedTime.value.hourOfPeriod;
final minute = selectedTime.value.minute.toString().padLeft(2, '0');
final period = selectedTime.value.period == DayPeriod.am ? 'AM' : 'PM';
final formattedTime = "$hour:$minute $period";
      Reminder reminder = Reminder(
        date: selectedDate.value,
        time: formattedTime,
        type: reminderTypeController.text.trim(),
        notes: notesController.text.trim(),
      );

      await _reminderService.addReminder(reminder);
      await loadReminders(); // Refresh list

      isLoading.value = false;
      Get.back(); // or show snackbar
    }
  }

  Future<void> loadReminders() async {
    isLoading.value = true;
    reminders.value = await _reminderService.getReminders();
    isLoading.value = false;
  }

  Future<void> deleteReminder(String id) async {
    isLoading.value = true;
    await _reminderService.deleteReminder(id);
    reminders.removeWhere((r) => r.id == id);
    isLoading.value = false;
  }

  Future<void> updateReminder(Reminder updatedReminder) async {
    if (updatedReminder.id != null) {
      isLoading.value = true;
      await _reminderService.updateReminder(updatedReminder);
      await loadReminders();
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    reminderTypeController.dispose();
    notesController.dispose();
    super.onClose();
  }
}
