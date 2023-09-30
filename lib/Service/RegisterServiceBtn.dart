import 'dart:developer';
import 'package:dummy_fire/View/Pages/LoginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'signUpUser.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart'; // Import EasyLoading

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
      // Show loading indicator
      EasyLoading.show(status: 'Creating User...');

      final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userEmail,
        password: userPassword,
      );
      Get.to(()=>LoginScreen());
      // Dismiss loading indicator when user creation is successful
      EasyLoading.dismiss();

      log("User created: ${userCredential.user?.email}");
      signUpUser(userName, userEmail, userPhone, userPassword, userCPassword);
      print('User created');
    } catch (error) {
      // Dismiss loading indicator when an error occurs
      EasyLoading.dismiss();

      // Show an error SnackBar
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
