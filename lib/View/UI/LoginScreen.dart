import 'package:dummy_fire/View/UI/HomePage.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../Static/Colors.dart';
import '../Static/ImageLogo.dart';
import 'package:flutter/material.dart';
import '../Static/TextStyleWidgets.dart';
import '../Widgets/CustomSocialIcons.dart';
import '../Widgets/CustomTextField.dart';
import '../Widgets/CustomTextLandS.dart';
import '../Widgets/CustonDivider.dart';
import '../Widgets/CutomBtnTextIcon.dart';
import '../Widgets/TextWithUnderLine.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<LoginScreen> {
  TextEditingController emailtextController = TextEditingController();
  TextEditingController passwordtextController = TextEditingController();

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
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, 'register');
                                },
                                child: Image.asset('assets/icons/back.png')))),
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
                  'Hey there,',
                  style: AuthTextstyle.smallheadindTextStyle,
                ),
                Text(
                  'Welcome Back',
                  style: AuthTextstyle.headindTextStyle,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomInputField(
                  labelText: 'Email',
                  images: 'assets/icons/email.png',
                  controller: emailtextController,
                ),
                CustomInputField(
                  labelText: 'Password',
                  images: 'assets/icons/Lock.png',
                  controller: passwordtextController,
                ),
                Container(
                  width: 315,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: TextUndeLine(
                        text: 'Forgot Password?',
                        onPressed: () {
                          Navigator.pushNamed(context, 'forgotpassword');
                        }),
                  ),
                ),
                SizedBox(
                  height: 150,
                ),
                CustomButtonIcon(
                  text: 'Login',
                  onPressed: () async {
                    var loginEmail = emailtextController.text.trim();
                    var loginPassword = passwordtextController.text.trim();
                    try {
                      final User? firebaseUser = (await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: loginEmail, password: loginPassword))
                          .user;
                      if (firebaseUser != null) {
                        Get.to(() => HomePage());
                      } else {
                        print('check email and password');
                      }
                    } on FirebaseAuthException catch (e) {
                      print('error$e');
                    }
                  },
                  image: 'assets/icons/Login.png',
                ),
                TextWithDivider(
                  text: 'or',
                ),
                CustomSocialIcons(
                    onFacebookPressed: () {},
                    onGooglePressed: () {},
                    onTwitterPressed: () {}),
                SizedBox(
                  height: 10,
                ),
                CustomTextLandS(
                  text1: "Don't have an account?",
                  text2: 'Register',
                  onPressed: () {
                    Navigator.pushNamed(context, 'register');
                  },
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
