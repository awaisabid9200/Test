import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Users.dart';
class RegisterBtn {
  final TextEditingController usernametextController;
  final TextEditingController emailtextController;
  final TextEditingController phonetextController;
  final TextEditingController passwordtextController;
  final TextEditingController confirmpasswordtextController;
  RegisterBtn({
    required this.usernametextController,
    required this.emailtextController,
    required this.phonetextController,
    required this.passwordtextController,
    required this.confirmpasswordtextController,
  });
  Future<void> registerUser() async {
    var userName = usernametextController.text.trim();
    var userPhone = phonetextController.text.trim();
    var userEmail = emailtextController.text.trim();
    var userPassword = passwordtextController.text.trim();
    var userCPassword = confirmpasswordtextController.text.trim();
    try {
      // Show a loading SnackBar
      Get.snackbar(
        'Creating User...',
        'Please wait...',
        showProgressIndicator: true,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withOpacity(0.8),
      );
      final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userEmail,
        password: userPassword,
      );
      // User creation successful, hide the SnackBar
      Get.back();
      log("User created: ${userCredential.user?.email}");
      signUpUser(userName, userEmail, userPhone, userPassword, userCPassword);
      print('User created');
    } catch (error) {
      // Hide the loading SnackBar and show an error SnackBar
      Get.back();
      Get.snackbar(
        'Error',
        'Failed to create user: $error',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      print('Failed to create user: $error');
    }
  }
}
