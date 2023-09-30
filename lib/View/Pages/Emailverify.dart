import 'package:dummy_fire/Service/auth_sevices.dart';
import '../../Service/Validation_method.dart';
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
  final ForgotPassword _authService = ForgotPassword();
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
                    const SizedBox(
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
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Welcome Back',
                  style: AuthTextstyle.headindTextStyle,
                ),
                CustomTextVerify(
                    text:
                        'Please enter  your email  address\n You will receive a link to create a\n new password via email.'),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: CustomInputField(
                    labelText: 'Email',
                    images: 'assets/icons/email.png',
                    controller: emailtextController,
                    validator: ValidationService.validateEmail,
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                CustomButton(
                  onPressed: () async{
                    if (_formKey.currentState!.validate()) {
                      final email = emailtextController.text.trim();
                      await _authService.resetPassword(context, email);
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
