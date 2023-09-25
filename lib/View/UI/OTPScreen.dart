import '../Static/Colors.dart';
import '../Static/ImageLogo.dart';
import '../Widgets/CustomButton3.dart';
import 'package:flutter/material.dart';

import '../Static/ImageLogo.dart';
import '../Static/TextStyleWidgets.dart';
import '../Widgets/CustomverifyText.dart';
import '../Widgets/CutomBtnText.dart';
import '../Widgets/TextWithUnderLine.dart';

class OTPScreen extends StatefulWidget {
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  List<FocusNode> _focusNodes = [];
  List<TextEditingController> _controllers = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 4; i++) {
      _focusNodes.add(FocusNode());
      _controllers.add(TextEditingController());
    }
  }

  @override
  void dispose() {
    for (int i = 0; i < 4; i++) {
      _focusNodes[i].dispose();
      _controllers[i].dispose();
    }
    super.dispose();
  }

  void _nextField(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backColor,
      body: Column(
        children: [
          Center(child: LogoImageContainer()),
          SizedBox(
            height: 20,
          ),
          Text(
            'Phone Verification',
            style: AuthTextstyle.headindTextStyle,
          ),
          CustomTextVerify(text: 'Please Enter Your OTP Here'),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              4,
              (index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 50,
                  child: TextFormField(
                    controller: _controllers[index],
                    focusNode: _focusNodes[index],
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    cursorColor: AppColors.LandSColor,
                    keyboardType: TextInputType.number,
                    obscureText: true,
                    style: TextStyle(
                      color: _focusNodes[index].hasFocus
                          ? Colors.black
                          : Colors.red,
                    ),
                    decoration: InputDecoration(
                      counterText: '',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.inputBorder),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.LandSColor),
                      ),
                    ),
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        if (index < 3) {
                          _nextField(value, _focusNodes[index + 1]);
                        }
                      }
                    },
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          CustomButton(text: 'Verify Code', onPressed: () {}),
          SizedBox(
            height: 20,
          ),
          Text('Didn`t received any code yet?',
              style: TextStyle(color: Color(0xff7B6F72),fontWeight: FontWeight.w500,fontSize: 12)),
          SizedBox(height: 15,),
          TextUndeLine(onPressed: (){}, text:'Re-Send Code')
        ],
      ),
    );
  }
}
