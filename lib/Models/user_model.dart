class UserModel {
  final String name;
  final String gender;
  final int Email;
  final String Phone;
  final String Country;
  final String City;
  final String Address;
  final String imageUrl;

  UserModel({
    required this.name,
    required this.gender,
    required this.Email,
    required this.Phone,
    required this.Country,
    required this.City,
    required this.Address,
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'gender': gender,
      'Email': Email,
      'Phone': Phone,
      'Country': Country,
      'City': City,
      'Address': Address,
      'imageUrl': imageUrl,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      gender: map['gender'],
      Email: map['Email'],
      Phone: map['Phone'],
      Country: map['Country'],
      City: map['City'],
      Address: map['Address'],
      imageUrl: map['imageUrl'],
    );
  }
}
