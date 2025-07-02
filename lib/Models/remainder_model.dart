class Reminder {
  String? id;
  DateTime date;
  String time;
  String type;
  String notes;

  Reminder({
    this.id,
    required this.date,
    required this.time,
    required this.type,
    required this.notes,
  });

  Map<String, dynamic> toMap() {
    return {
      'date': date.toIso8601String(),
      'time': time,
      'type': type,
      'notes': notes,
    };
  }

  factory Reminder.fromMap(Map<String, dynamic> map, String docId) {
    return Reminder(
      id: docId,
      date: DateTime.parse(map['date']),
      time: map['time'],
      type: map['type'],
      notes: map['notes'],
    );
  }
}
