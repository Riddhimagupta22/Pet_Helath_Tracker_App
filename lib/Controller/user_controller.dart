import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../Models/user_model.dart';

class UserController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final genderController = TextEditingController();
  final countryController = TextEditingController();
  final cityController = TextEditingController();
  final addressController = TextEditingController();

  final imageUrl = ''.obs;
  Rx<UserModel?> currentUser = Rx<UserModel?>(null);

  final supabase = Supabase.instance.client;

  /// Fetch user from Supabase DB
  Future<void> fetchUserFromDB() async {
    final uid = supabase.auth.currentUser?.id;
    if (uid == null) return;

    final response = await supabase
        .from('users')
        .select()
        .eq('id', uid)
        .single();

    if (response != null) {
      final user = UserModel.fromMap(response);
      loadUserData(user);
      imageUrl.value = response['image_url'] ?? '';
    }
  }

  /// Update user profile in Supabase
  Future<void> updateUser() async {
    final updated = updatedUser;

    await supabase.from('users').update(updated.toMap()).eq('id', updated.id);
    Get.snackbar('Success', 'Profile updated');
  }

  /// Load data to UI
  void loadUserData(UserModel user) {
    currentUser.value = user;
    nameController.text = user.name;
    emailController.text = user.email;
    phoneController.text = user.phone;
    genderController.text = user.gender;
    countryController.text = user.country;
    cityController.text = user.city;
    addressController.text = user.address;
  }

  /// Return updated user from controllers
  UserModel get updatedUser => UserModel(
    id: currentUser.value!.id,
    name: nameController.text.trim(),
    email: emailController.text.trim(),
    phone: phoneController.text.trim(),
    gender: genderController.text.trim(),
    country: countryController.text.trim(),
    city: cityController.text.trim(),
    address: addressController.text.trim(),
  );

  /// Pick and upload profile image
  Future<void> pickAndUploadImage({required bool fromGallery}) async {
    final pickedFile = await ImagePicker().pickImage(
      source: fromGallery ? ImageSource.gallery : ImageSource.camera,
      imageQuality: 75,
    );

    if (pickedFile == null) return;

    final file = File(pickedFile.path);
    final uid = supabase.auth.currentUser?.id;

    if (uid == null) return;

    final fileExt = pickedFile.path.split('.').last;
    final filePath = 'avatars/$uid/profile.$fileExt';

    final response = await supabase.storage.from('user-avatars').upload(
      filePath,
      file,
      fileOptions: FileOptions(upsert: true),
    );

    final publicUrl =
    supabase.storage.from('user-avatars').getPublicUrl(filePath);

    // Save URL to database
    await supabase
        .from('users')
        .update({'image_url': publicUrl})
        .eq('id', uid);

    imageUrl.value = publicUrl;
    Get.snackbar('Success', 'Image uploaded');
  }
}
