import 'package:dummy_fire/View/Pages/HomePage.dart';
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

import 'PhoneNumber.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<LoginScreen> {
  TextEditingController emailtextController = TextEditingController();
  TextEditingController passwordtextController = TextEditingController();
  bool isLoggingIn = false;

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
                    if (isLoggingIn) {
                      // Don't proceed if the login process is already in progress.
                      return;
                    }
                    setState(() {
                      isLoggingIn = true;
                    });
                    var loginEmail = emailtextController.text.trim();
                    var loginPassword = passwordtextController.text.trim();
                    try {
                      final UserCredential userCredential = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(email: loginEmail, password: loginPassword);
                      final User? firebaseUser = userCredential.user;
                      if (firebaseUser != null) {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: Row(
                                children: [
                                  CircularProgressIndicator(),
                                  SizedBox(width: 20),
                                  Text(
                                    'Loading...',
                                    style: TextStyle(color: AppColors.inputBorder),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                        Future.delayed(Duration(seconds: 2), () {
                          Navigator.of(context).pop(); // Close the AlertDialog
                          Get.to(() => PhoneVerify());
                        });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Check email and password'),
                            duration: Duration(seconds: 3),
                          ),
                        );
                      }
                    } on FirebaseAuthException catch (e) {
                      // Display an error Snackbar.
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Error: ${e.message}'),
                          duration: Duration(seconds: 3),
                        ),
                      );
                    } finally {
                      setState(() {
                        isLoggingIn = false;
                      });
                    }
                  },
                  image: 'assets/icons/Login.png',
                ),
                // CustomButtonIcon(
                //   text: 'Login',
                //   onPressed: () async {
                //     if (isLoggingIn) {
                //       // Don't proceed if the login process is already in progress.
                //       return;
                //     }
                //     setState(() {
                //       isLoggingIn = true;
                //     });
                //     var loginEmail = emailtextController.text.trim();
                //     var loginPassword = passwordtextController.text.trim();
                //     try {
                //       final User? firebaseUser = (await FirebaseAuth.instance
                //               .signInWithEmailAndPassword(
                //                   email: loginEmail, password: loginPassword))
                //           .user;
                //       if (firebaseUser != null) {
                //         showDialog(
                //           context: context,
                //           barrierDismissible: false,
                //           builder: (BuildContext context) {
                //             return SizedBox(
                //               height: 100,
                //               width: 200,
                //               child: AlertDialog(
                //                 content: Row(
                //                   children: [
                //                     CircularProgressIndicator(),
                //                     SizedBox(width: 20,),
                //                     Text('Loading...',style: TextStyle(color: AppColors.inputBorder),)
                //                   ],
                //                 ),
                //               ),
                //             );
                //           },
                //         );
                //         Future.delayed(Duration(seconds: 2), () {
                //           Navigator.of(context).pop(); // Close the AlertDialog
                //           Get.to(() => HomePage());
                //         });
                //       } else {
                //         ScaffoldMessenger.of(context).showSnackBar(
                //           SnackBar(
                //             content: Text('Check email and password'),
                //             duration: Duration(seconds: 3),
                //           ),
                //         );
                //       }
                //     } on FirebaseAuthException catch (e) {
                //       // Display an error Snackbar.
                //       ScaffoldMessenger.of(context).showSnackBar(
                //         SnackBar(
                //           content: Text('Error: $e'),
                //           duration: Duration(seconds: 3),
                //         ),
                //       );
                //     } finally {
                //       setState(() {
                //         isLoggingIn = false;
                //       });
                //     }
                //   },
                //   image: 'assets/icons/Login.png',
                // ),
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
