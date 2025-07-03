class VetVisitModel {
  final String? id;
  final String date;
  final String reason;
  final String notes;


  VetVisitModel({
    this.id,
    required this.date,
    required this.reason,
    required this.notes,

  });

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'reason': reason,
      'notes': notes,

    };
  }

  factory VetVisitModel.fromJson(Map<String, dynamic> json, String id) {
    return VetVisitModel(
      id: id,
      date: json['date'] ?? '',
      reason: json['reason'] ?? '',
      notes: json['notes'] ?? '',

    );
  }
}
