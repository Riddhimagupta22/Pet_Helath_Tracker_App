import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_app/Models/User_model.dart';

import '../Models/user_model.dart';
import '../Services/user_service.dart';

class UserController extends GetxController {
  final namecontroller = TextEditingController();
  final gendercontroller = TextEditingController();
  final Emailcontroller = TextEditingController();
  final Phonecontroller = TextEditingController();
  final Countrycontroller = TextEditingController();
  final Citycontroller = TextEditingController();
  final AddressController = TextEditingController();

  var imageUrl = ''.obs;

  final _userService = UserService();

  // @override
  // void onInit() {
  //   loadProfile();
  //   super.onInit();
  // }
  //
  // void saveProfile() async {
  //   final user = UserModel(
  //     name: namecontroller.text.trim(),
  //     gender: gendercontroller.text.trim(),
  //     Email: Emailcontroller.text,
  //     Phone: Phonecontroller.text.trim(),
  //     Country: Countrycontroller.text.trim(),
  //     City: Citycontroller.text.trim(),
  //     Address: AddressController.text.trim(),
  //     imageUrl: imageUrl.value,
  //   );
  //
  //   await _userService.saveUserProfile(user );
  //   Get.snackbar('Success', 'user profile saved!');
  // }
  //
  // void loadProfile() async {
  //   final user = await _userService.getUserProfile();
  //   if (user != null) {
  //     namecontroller.text = user.name;
  //    gendercontroller.text = user.gender;
  //     Emailcontroller.text = user.Email as String;
  //     Countrycontroller.text = user.Country;
  //     Citycontroller.text = user.City;
  //     AddressController.text = user.Address;
  //     imageUrl.value = user.imageUrl;
  //   }
  // }
  //
  // void updateImage(String url) {
  //   imageUrl.value = url;
  // }
  //
  // Future<void> pickAndUploadImage(bool pickFromGallery) async {
  //   try {
  //     final picker = ImagePicker();
  //     final pickedFile = await picker.pickImage(
  //       source: pickFromGallery ? ImageSource.gallery : ImageSource.camera,
  //     );
  //
  //     if (pickedFile == null) {
  //       print("No image selected.");
  //       return;
  //     }
  //
  //     final cropped = await cropImage(pickedFile);
  //
  //     if (cropped != null) {
  //       final compressed = await compressImage(cropped);
  //       imageUrl.value = compressed.path;
  //       update();
  //     }
  //   } catch (e) {
  //     print("Image picking failed: $e");
  //   }
  // }
  //
  // Future<File?> cropImage(XFile image) async {
  //   try {
  //     final croppedFile = await ImageCropper().cropImage(
  //       sourcePath: image.path,
  //       aspectRatioPresets: [
  //         CropAspectRatioPreset.square,
  //         CropAspectRatioPreset.ratio4x3,
  //         CropAspectRatioPreset.ratio7x5,
  //         CropAspectRatioPreset.ratio16x9,
  //         CropAspectRatioPreset.original,
  //       ],
  //       uiSettings: [
  //         AndroidUiSettings(
  //           toolbarTitle: 'Crop Image',
  //           initAspectRatio: CropAspectRatioPreset.original,
  //           lockAspectRatio: false,
  //         ),
  //         IOSUiSettings(title: 'Crop Image'),
  //       ],
  //     );
  //
  //     return croppedFile != null ? File(croppedFile.path) : null;
  //   } catch (e) {
  //     print("Cropping failed: $e");
  //     return null;
  //   }
  // }
  //
  // Future<XFile> compressImage(File file) async {
  //   final dir = Directory.systemTemp;
  //   final targetPath = '${dir.path}/${basename(file.path)}';
  //
  //   final result = await FlutterImageCompress.compressAndGetFile(
  //     file.absolute.path,
  //     targetPath,
  //     quality: 70,
  //   );
  //
  //   return result!;
  // }
}
