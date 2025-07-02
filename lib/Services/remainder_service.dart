import 'package:cloud_firestore/cloud_firestore.dart';

import '../Models/remainder_model.dart';


class ReminderService {
  final CollectionReference reminderCollection =
  FirebaseFirestore.instance.collection('reminders');

  Future<void> addReminder(Reminder reminder) async {
    await reminderCollection.add(reminder.toMap()); // Auto ID
  }

  Future<List<Reminder>> getReminders() async {
    final snapshot = await reminderCollection.get();
    return snapshot.docs.map((doc) {
      return Reminder.fromMap(doc.data() as Map<String, dynamic>, doc.id);
    }).toList();
  }

  Future<void> deleteReminder(String id) async {
    await reminderCollection.doc(id).delete();
  }

  Future<void> updateReminder(Reminder reminder) async {
    if (reminder.id != null) {
      await reminderCollection.doc(reminder.id).update(reminder.toMap());
    }
  }
}
