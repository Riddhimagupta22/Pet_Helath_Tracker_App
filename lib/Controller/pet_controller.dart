// import 'package:get/get.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import '../models/pet_model.dart';
// import '../services/pet_service.dart';
//
// class PetController extends GetxController {
//   final petService = PetService();
//   final pets = <PetModel>[].obs;
//   final isLoading = false.obs;
//
//   final userId = FirebaseAuth.instance.currentUser?.uid;
//
//   @override
//   void onInit() {
//     super.onInit();
//     fetchPets();
//   }
//
//   void fetchPets() async {
//     if (userId == null) return;
//     isLoading.value = true;
//     try {
//       pets.value = await petService.fetchPets(userId!);
//     } catch (e) {
//       Get.snackbar("Error", "Failed to fetch pets");
//     } finally {
//       isLoading.value = false;
//     }
//   }
//
//   Future<void> addPet({
//     required String name,
//     required String breed,
//     required int age,
//     double? weight,
//     required String imageUrl,
//   }) async {
//     if (userId == null) return;
//
//     final newPet = PetModel(
//       id: '',
//       userId: userId!,
//       name: name,
//       breed: breed,
//       age: age,
//       weight: weight,
//       imageUrl: imageUrl,
//       createdAt: DateTime.now(),
//     );
//
//     try {
//       final savedPet = await petService.addPet(newPet);
//       if (savedPet != null) {
//         pets.insert(0, savedPet);
//         Get.back();
//       }
//
//     } catch (e) {
//       Get.snackbar("Error", "Failed to add pet");
//     }
//   }
//
//   Future<void> deletePet(String id) async {
//     try {
//       await petService.deletePet(id);
//       pets.removeWhere((pet) => pet.id == id);
//     } catch (e) {
//       Get.snackbar("Error", "Failed to delete pet");
//     }
//   }
// }
