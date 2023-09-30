import '../../Service/auth_sevices.dart';
import '../../Service/Validation_method.dart';
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

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<LoginScreen> {

  TextEditingController emailtextController = TextEditingController();
  TextEditingController passwordtextController = TextEditingController();

  final AuthService _authService = AuthService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


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
                                  Navigator.pushNamed(context, 'phoneauth');
                                },
                                child: Image.asset('assets/icons/call-.png')))),
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
                Form(
                  key: _formKey, // Use the _formKey for validation
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Column(
                    children: [
                      CustomInputField(
                        labelText: 'Email',
                        images: 'assets/icons/email.png',
                        controller: emailtextController,
                        validator: ValidationService.validateEmail,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      CustomInputField(
                        labelText: 'Password',
                        images: 'assets/icons/Lock.png',
                        controller: passwordtextController,
                        validator: ValidationService.validatePassword,
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
                          if (_formKey.currentState!.validate()) {
                            final email = emailtextController.text.trim();
                            final password = passwordtextController.text.trim();
                            await _authService.signIn(context,email, password);
                          }
                        },
                        image: 'assets/icons/Login.png',
                      ),
                    ],
                  ),
                ),
                TextWithDivider(
                  text: 'or',
                ),
                CustomSocialIcons(
                    onFacebookPressed: () {},
                    onGooglePressed: () {signInWithGoogle(context, 'HomePage');},
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
