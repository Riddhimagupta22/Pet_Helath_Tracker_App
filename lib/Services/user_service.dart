import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';

class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserModel?> getUser(String email) async {
    final doc = await _firestore.collection('users').doc(email).get();
    if (doc.exists) {
      return UserModel.fromMap(doc.data()!);
    }
    return null;
  }

  Future<void> updateUser(UserModel user) async {
    await _firestore.collection('users').doc(user.email).update(user.toMap());
  }

  Future<void> createUser(UserModel user) async {
    await _firestore.collection('users').doc(user.email).set(user.toMap());
  }
}
