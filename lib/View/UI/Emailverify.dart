import 'package:dummy_fire/View/UI/LoginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../Static/Colors.dart';
import '../Static/ImageLogo.dart';
import 'package:flutter/material.dart';
import '../Static/TextStyleWidgets.dart';
import '../Widgets/CustomTextField.dart';
import '../Widgets/CustomverifyText.dart';
import '../Widgets/CutomBtnText.dart';

class EmailVerify extends StatefulWidget {
  const EmailVerify({super.key});

  @override
  State<EmailVerify> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<EmailVerify> {
  TextEditingController emailtextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Image.asset('assets/icons/back.png'))),
                    Expanded(
                        flex: 2,
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: LogoImageContainer())),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Welcome Back',
                  style: AuthTextstyle.headindTextStyle,
                ),
                CustomTextVerify(
                    text:
                        'Please enter  your email  address\n You will receive a link to create a\n new password via email.'),
                SizedBox(
                  height: 20,
                ),
                CustomInputField(
                  labelText: 'Email',
                  images: 'assets/icons/email.png',
                  controller: emailtextController,
                ),
                SizedBox(
                  height: 60,
                ),
                CustomButton(
                  onPressed: () {
                    var forgotEmail = emailtextController.text.trim();
                    try {
                      FirebaseAuth.instance
                          .sendPasswordResetEmail(email: forgotEmail)
                          .then((value) => {
                                Get.off(() => LoginScreen()),
                                Get.snackbar('Email', 'OnLink'),
                              });
                    } on FirebaseAuthException catch (e) {
                      print('error$e');
                    }
                  },
                  text: 'Submit',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
