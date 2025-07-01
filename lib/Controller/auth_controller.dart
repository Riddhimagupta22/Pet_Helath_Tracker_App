import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Services/Auth/auth_service.dart';


class AuthController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final LoginformKey = GlobalKey<FormState>();

  final userNameController = TextEditingController();
  final confrimPasswordController = TextEditingController();
  final emailController = TextEditingController();
  final PasswordController = TextEditingController();

  final isLoading = false.obs;

  final authService = AuthService();

  String? validateUsername(String? value) {
    if (value!.isEmpty) {
      return 'Please enter a username';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  String? validateconfrimPassword(String? value) {
    if (value!.isEmpty) {
      return 'Please confirm your password';
    }
    if (value !=PasswordController.text ) {
      return 'Passwords do not match';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value!.isEmpty) return 'Please enter an Email';
    RegExp emailExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (emailExp.hasMatch(value)) {
      return null;
    }
    {
      return 'Please enter a valid Email';
    }
  }

  Future<void> submitForm(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      final data = {
        "username": userNameController.text.trim(),
        "email": emailController.text.trim(),
        "password": PasswordController.text,
        "Confrim Password": confrimPasswordController.text,
      };
      await authService.CreateUser(data, context);
      isLoading.value = false;
    }
  }

  Future<void> submitLoginForm(BuildContext context) async {
    if (LoginformKey.currentState!.validate()) {
      isLoading.value = true;
      final data = {

        "password": PasswordController.text,
        "email": emailController.text.trim(),
        "username": userNameController.text.trim(),
      };
      await authService.login(data, context);
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    userNameController.dispose();
    confrimPasswordController.dispose();
    emailController.dispose();
    PasswordController.dispose();
    super.onClose();
  }
}