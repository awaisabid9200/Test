import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../Service/RegisterServiceBtn.dart';
import '../../Service/Validation_method.dart';
import '../Static/Colors.dart';
import '../Static/ImageLogo.dart';
import '../Static/TextStyleWidgets.dart';
import '../Widgets/CustomCheckBox.dart';
import '../Widgets/CustomSocialIcons.dart';
import '../Widgets/CustomTextField.dart';
import '../Widgets/CustomTextLandS.dart';
import '../Widgets/CustonDivider.dart';
import '../Widgets/CutomBtnText.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Hey there,',
                style: AuthTextstyle.smallheadindTextStyle,
              ),
              const Text(
                'Create an Account',
                style: AuthTextstyle.headindTextStyle,
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Column(
                  children: [
                    CustomInputField(
                      labelText: 'First Name',
                      images: 'assets/icons/Profile.png',
                      controller: usernametextController,
                      validator: FormValidator
                          .validateFirstName, // Use the validation method
                      keyboardType: TextInputType.text,
                    ),
                    CustomInputField(
                      labelText: 'Email',
                      images: 'assets/icons/email.png',
                      controller: emailtextController,
                      validator: FormValidator
                          .validateEmail, // Use the validation method
                      keyboardType: TextInputType.emailAddress,
                    ),
                    CustomInputField(
                      labelText: 'Phone',
                      images: 'assets/icons/Call.png',
                      controller: phonetextController,
                      validator: FormValidator
                          .validatePhone, // Use the validation method
                      keyboardType: TextInputType.phone,
                    ),
                    CustomInputField(
                      labelText: 'Password',
                      images: 'assets/icons/Lock.png',
                      controller: passwordtextController,
                      validator: FormValidator
                          .validatePassword, // Use the validation method
                    ),
                    CustomInputField(
                      labelText: 'Confirm Password',
                      images: 'assets/icons/Lock-1.png',
                      controller: confirmpasswordtextController,
                      validator: (value) =>
                          FormValidator.validateConfirmPassword(
                              value,
                              passwordtextController
                                  .text), // Use the validation method
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
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                text: 'Register',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    registerButton.registerUser();
                  }
                },
              ),
              TextWithDivider(
                text: 'or',
              ),
              CustomSocialIcons(
                  onFacebookPressed: () {},
                  onGooglePressed: () {},
                  onTwitterPressed: () {}),
              const SizedBox(
                height: 10,
              ),
              CustomTextLandS(
                text1: 'Already have an account?',
                text2: 'LogIn',
                onPressed: () {
                  Navigator.pushNamed(context, 'login');
                },
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
