import '../Static/Colors.dart';
import '../Static/ImageLogo.dart';
import 'package:flutter/material.dart';
import '../Static/TextStyleWidgets.dart';
import '../Widgets/CustomSocialIcons.dart';
import '../Widgets/CustomTextField.dart';
import '../Widgets/CustomTextLandS.dart';
import '../Widgets/CustomverifyText.dart';
import '../Widgets/CustonDivider.dart';
import '../Widgets/CutomBtnText.dart';
import '../Widgets/CutomBtnTextIcon.dart';
import '../Widgets/TextWithUnderLine.dart';

class CreatePassword extends StatefulWidget {
  const CreatePassword({super.key});

  @override
  State<CreatePassword> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<CreatePassword> {
  TextEditingController passwordtextController = TextEditingController();
  TextEditingController confirmpasswordtextController = TextEditingController();

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
                  'Create\n New Password',
                  style: AuthTextstyle.headindTextStyle,
                  textAlign: TextAlign.center,
                ),
                CustomTextVerify(
                    text:
                        'Please Enter New Password'),
                SizedBox(
                  height: 20,
                ),
                CustomInputField(
                  labelText: 'Password',
                  images: 'assets/icons/Lock.png',
                  controller: passwordtextController,
                ),
                CustomInputField(
                  labelText: 'ConfirmPassword',
                  images: 'assets/icons/Lock-1.png',
                  controller: confirmpasswordtextController,
                ),
                SizedBox(
                  height: 60,
                ),
                CustomButton(
                  onPressed: () {},
                  text: 'Change Password',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
