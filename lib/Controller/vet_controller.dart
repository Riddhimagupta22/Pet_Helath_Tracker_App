import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Models/vet_model.dart';
import '../Services/vet_service.dart';
import 'package:intl/intl.dart';

class VetVisitController extends GetxController {
  final petNameController = TextEditingController();
  final reasonController = TextEditingController();
  final notesController = TextEditingController();
  final dateController = TextEditingController();

  final selectedDate = DateTime.now().obs;
  final selectedTime = TimeOfDay.now().obs;
  final formKey = GlobalKey<FormState>();

  final vetVisits = <VetVisitModel>[].obs;

  final VetVisitService _service = VetVisitService();

  Future<void> saveVisit() async {
    if (!formKey.currentState!.validate()) return;

    final fullDateTime = DateTime(
      selectedDate.value.year,
      selectedDate.value.month,
      selectedDate.value.day,
      selectedTime.value.hour,
      selectedTime.value.minute,
    );

    final formattedDateTime =
        DateFormat('yyyy-MM-dd hh:mm a').format(fullDateTime);
    dateController.text = formattedDateTime;

    final visit = VetVisitModel(
      date: formattedDateTime,
      reason: reasonController.text.trim(),
      notes: notesController.text.trim(),
    );

    await _service.saveVetVisit(visit);

    Get.snackbar('Success', 'Vet visit logged successfully!');
    clearFields();
    fetchVetVisits();
  }

  void delete(String id) async {
    await _service.deleteVetVisit(id);
    fetchVetVisits();
  }

  void clearFields() {
    petNameController.clear();
    reasonController.clear();
    notesController.clear();
    dateController.clear();
    selectedDate.value = DateTime.now();
    selectedTime.value = TimeOfDay.now();
  }

  Future<void> fetchVetVisits() async {
    final visits = await _service.getAllVetVisits();
    vetVisits.assignAll(visits);
  }

  @override
  void onInit() {
    fetchVetVisits();
    super.onInit();
  }
}
