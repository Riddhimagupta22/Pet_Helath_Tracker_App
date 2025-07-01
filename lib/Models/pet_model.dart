class PetModel {
  final String id;
  final String userId;
  final String name;
  final String breed;
  final int age;
  final double? weight;
  final String imageUrl;
  final DateTime createdAt;

  PetModel({
    required this.id,
    required this.userId,
    required this.name,
    required this.breed,
    required this.age,
    this.weight,
    required this.imageUrl,
    required this.createdAt,
  });

  factory PetModel.fromMap(Map<String, dynamic> map) {
    return PetModel(
      id: map['id'],
      userId: map['user_id'],
      name: map['name'],
      breed: map['breed'],
      age: map['age'],
      weight: map['weight']?.toDouble(),
      imageUrl: map['image_url'],
      createdAt: DateTime.parse(map['created_at']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user_id': userId,
      'name': name,
      'breed': breed,
      'age': age,
      'weight': weight,
      'image_url': imageUrl,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
