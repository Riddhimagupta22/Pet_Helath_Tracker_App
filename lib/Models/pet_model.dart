class PetModel {
  final String name;
  final String gender;
  final String weight;
  final String age;
  final String imageUrl;

  PetModel({
    required this.name,
    required this.gender,
    required this.weight,
    required this.age,
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'gender': gender,
      'weight': weight,
      'age': age,
      'imageUrl': imageUrl,
    };
  }

  factory PetModel.fromMap(Map<String, dynamic> map) {
    return PetModel(
      name: map['name']?.toString() ?? '',
      gender: map['gender']?.toString() ?? '',
      weight: map['weight']?.toString() ?? '',
      age: map['age']?.toString() ?? '',
      imageUrl: map['imageUrl']?.toString() ?? '',
    );
  }
}
