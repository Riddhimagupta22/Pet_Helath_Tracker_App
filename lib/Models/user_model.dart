class UserModel {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String gender;
  final String country;
  final String city;
  final String address;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.gender,
    required this.country,
    required this.city,
    required this.address,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      phone: map['phone'],
      gender: map['gender'] ?? '',
      country: map['country'] ?? '',
      city: map['city'] ?? '',
      address: map['address'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'gender': gender,
      'country': country,
      'city': city,
      'address': address,
    };
  }
}
