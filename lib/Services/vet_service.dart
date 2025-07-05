import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Models/vet_model.dart';

class VetVisitService {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  Future<void> saveVetVisit(VetVisitModel visit) async {
    final user = _auth.currentUser;
    if (user == null){print('User not logged in');}

    final timestamp = DateTime.now().toIso8601String();

    await _firestore
        .collection('users')
        .doc(user?.uid)
        .collection('vet_visits')
        .doc(timestamp)
        .set(visit.toJson());
  }

  Future<void> deleteVetVisit(String id) async {
    final user = _auth.currentUser;
    if (user == null) {print ('User not logged in');}

    await _firestore
        .collection('users')
        .doc(user?.uid)
        .collection('vet_visits')
        .doc(id)
        .delete();
  }


  Future<List<VetVisitModel>> getAllVetVisits() async {
    final user = _auth.currentUser;
    if (user == null){print('User not logged in');}

    final snapshot = await _firestore
        .collection('users')
        .doc(user?.uid)
        .collection('vet_visits')
        .orderBy('date', descending: true)
        .get();

    return snapshot.docs
        .map((doc) => VetVisitModel.fromJson(doc.data(),doc.id))
        .toList();
  }
}
