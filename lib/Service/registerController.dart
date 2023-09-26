import 'package:flutter/material.dart';
import 'package:get/get.dart';
class RegisterController extends GetxController {
  final TextEditingController usernametextController = TextEditingController();
  final TextEditingController emailtextController = TextEditingController();
  final TextEditingController phonetextController = TextEditingController();
  final TextEditingController passwordtextController = TextEditingController();
  final TextEditingController confirmpasswordtextController =
  TextEditingController();
  final RxBool isPrivacyAccepted = false.obs;
  final RxBool isProcessing = false.obs; // To track registration process
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // Function to register a user
  void registerUser() async {
    if (formKey.currentState!.validate()) {
      isProcessing.value = true;
      // Add your registration logic here
      // Example: Firebase authentication
      isProcessing.value = false;
    }
  }
}
