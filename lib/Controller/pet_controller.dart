import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

import '../Models/pet_model.dart';
import '../Services/pet_service.dart';

class PetController extends GetxController {
  final nameController = TextEditingController();
  final genderController = TextEditingController();
  final weightController = TextEditingController();
  final ageController = TextEditingController();

  var imageUrl = ''.obs;

  final PetService _petService = PetService();

  @override
  void onInit() {
    loadProfile();
    super.onInit();
  }

  void saveProfile() async {
    final pet = PetModel(
      name: nameController.text.trim(),
      gender: genderController.text.trim(),
      weight: weightController.text.trim(),
      age: ageController.text.trim(),
      imageUrl: imageUrl.value,
    );

    await _petService.savePetProfile(pet);
    Get.snackbar('Success', 'Pet profile saved!');
  }

  void loadProfile() async {
    final pet = await _petService.getPetProfile();
    if (pet != null) {
      nameController.text = pet.name;
      genderController.text = pet.gender;
      weightController.text = pet.weight;
      ageController.text = pet.age;
      imageUrl.value = pet.imageUrl;
    }
  }

  void updateImage(String url) {
    imageUrl.value = url;
  }

  Future<void> pickAndUploadImage(bool pickFromGallery) async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(
        source: pickFromGallery ? ImageSource.gallery : ImageSource.camera,
      );

      if (pickedFile == null) {
        print("No image selected.");
        return;
      }

      final cropped = await cropImage(pickedFile);

      if (cropped != null) {
        final compressed = await compressImage(cropped);
        imageUrl.value = compressed.path;
        update();
      }
    } catch (e) {
      print("Image picking failed: $e");
    }
  }

  Future<File?> cropImage(XFile image) async {
    try {
      final CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: image.path,
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Crop Image',
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false,
            aspectRatioPresets: [
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio7x5,
              CropAspectRatioPreset.ratio16x9,
              CropAspectRatioPreset.original,
            ],
          ),
          IOSUiSettings(
            title: 'Crop Image',
            aspectRatioLockEnabled: false,
          ),
        ],
      );

      return croppedFile != null ? File(croppedFile.path) : null;
    } catch (e) {
      print("Cropping failed: $e");
      return null;
    }
  }



  Future<XFile> compressImage(File file) async {
    final dir = Directory.systemTemp;
    final targetPath = '${dir.path}/${basename(file.path)}';

    final result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      targetPath,
      quality: 70,
    );

    return result!;
  }
}
