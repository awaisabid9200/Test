import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../Service/RegisterServiceBtn.dart';
import '../../Service/Users.dart';
import '../Static/Colors.dart';
import '../Static/ImageLogo.dart';
import '../Static/TextStyleWidgets.dart';
import '../Widgets/CustomCheckBox.dart';
import '../Widgets/CustomSocialIcons.dart';
import '../Widgets/CustomTextField.dart';
import '../Widgets/CustomTextLandS.dart';
import '../Widgets/CustonDivider.dart';
import '../Widgets/CutomBtnText.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController usernametextController = TextEditingController();
  TextEditingController emailtextController = TextEditingController();
  TextEditingController phonetextController = TextEditingController();
  TextEditingController passwordtextController = TextEditingController();
  TextEditingController confirmpasswordtextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  User? crrentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {

    final registerButton = RegisterBtn(
      usernametextController: usernametextController,
      emailtextController: emailtextController,
      phonetextController: phonetextController,
      passwordtextController: passwordtextController,
      confirmpasswordtextController: confirmpasswordtextController,
    );

    return Scaffold(
      backgroundColor: AppColors.backColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(child: LogoImageContainer()),
              SizedBox(
                height: 20,
              ),
              Text(
                'Hey there,',
                style: AuthTextstyle.smallheadindTextStyle,
              ),
              Text(
                'Create an Account',
                style: AuthTextstyle.headindTextStyle,
              ),
              SizedBox(
                height: 20,
              ),
              Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    CustomInputField(
                      labelText: 'First Name',
                      images: 'assets/icons/Profile.png',
                      controller: usernametextController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your first name';
                        }
                        return null; // Return null if the input is valid
                      },
                    ),
                    CustomInputField(
                      labelText: 'Email',
                      images: 'assets/icons/email.png',
                      controller: emailtextController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter an email address';
                        } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null; // Return null if the input is valid
                      },
                    ),
                    CustomInputField(
                      labelText: 'Phone',
                      images: 'assets/icons/Call.png',
                      controller: phonetextController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your phone number';
                        } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                          return 'Please enter a valid phone number';
                        }
                        return null; // Return null if the input is valid
                      },
                    ),
                    CustomInputField(
                      labelText: 'Password',
                      images: 'assets/icons/Lock.png',
                      controller: passwordtextController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a password';
                        } else if (value.length < 6) {
                          return 'Password must be at least 6 characters long';
                        }
                        return null; // Return null if the input is valid
                      },
                    ),
                    CustomInputField(
                      labelText: 'Confirm Password',
                      images: 'assets/icons/Lock-1.png',
                      controller: confirmpasswordtextController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please confirm your password';
                        } else if (value != passwordtextController.text) {
                          return 'Passwords do not match';
                        }
                        return null; // Return null if the input is valid
                      },
                    ),
                  ],
                ),
              ),

              CustomCheckboxWithText(
                text: 'By continuing you accept our',
                text1: 'Privacy Policy',
                text2: 'and',
                text3: 'Term of use',
                initialValue: false,
                onChanged: (bool newValue) {
                  print('Checkbox value changed: $newValue');
                },
              ),
              SizedBox(
                height: 20,
              ),
              CustomButton(
                  text: 'Register',
                  onPressed: (){if (_formKey.currentState!.validate()) {
                    registerButton.registerUser();
                  }},
                  //async {

                    // var userName = usernametextController.text.trim();
                    // var userPhone = phonetextController.text.trim();
                    // var userEmail = emailtextController.text.trim();
                    // var userPassword = passwordtextController.text.trim();
                    // var userCPassword =
                    //     confirmpasswordtextController.text.trim();
                    //
                    // await FirebaseAuth.instance
                    //     .createUserWithEmailAndPassword(
                    //         email: userEmail, password: userPassword)
                    //
                    //     .then((value) => {
                    //           log("user create"),
                    //           signUpUser(userName, userEmail, userPhone,
                    //               userPassword, userCPassword),
                    //           print('user create'),
                    //
                    //         });
                  //}
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
                text1: 'Already have an account?',
                text2: 'LogIn',
                onPressed: (){
                  Navigator.pushNamed(context,'Register');
                },
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
