import '../Static/Colors.dart';
import '../Static/ImageLogo.dart';
import '../Widgets/CustomButton3.dart';
import 'package:flutter/material.dart';
import '../Static/Colors.dart';
import '../Static/TextStyleWidgets.dart';
import '../Widgets/CustomTextField.dart';
import '../Widgets/CustomverifyText.dart';
import '../Widgets/CutomBtnTextIcon2.dart';
import '../Widgets/TextWithUnderLine.dart';

class PhoneVerify extends StatefulWidget {
  const PhoneVerify({super.key});

  @override
  State<PhoneVerify> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<PhoneVerify> {

  TextEditingController phonetextController = TextEditingController();


  @override
  Widget build(BuildContext context) {
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
                'Verify Phone Number',
                style: AuthTextstyle.headindTextStyle,
              ),
              CustomTextVerify(text:'We have sent you on SMS with a code\n to number +92 308 7658450',),
              SizedBox(
                height: 20,
              ),
              CustomInputField(
                labelText: 'Phone',
                images: 'assets/icons/Call.png',
                controller: phonetextController,
              ),
              Container(
                width: 315,
                child: Align(
                  alignment: Alignment.topRight,
                  child: TextUndeLine(text: 'Forgot Password?',onPressed: (){
                  }),
                ),
              ),
              SizedBox(height: 30,),
              CustomButtonIcon2(text: 'Send', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
