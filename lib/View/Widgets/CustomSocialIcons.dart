
import 'package:flutter/material.dart';

import '../Static/Colors.dart';

class CustomSocialIcons extends StatelessWidget {
  final VoidCallback onGooglePressed;
  final VoidCallback onTwitterPressed;
  final VoidCallback onFacebookPressed;

  CustomSocialIcons({
    required this.onGooglePressed,
    required this.onTwitterPressed,
    required this.onFacebookPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 315,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: onGooglePressed,
            child: Container(
              height: 50,
              width: 50,
              padding: EdgeInsets.all(13),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: AppColors.labelColor),
              ),
              child: Image.asset('assets/images/google.png'),
            ),
          ),
          SizedBox(width: 20),
          GestureDetector(
            onTap: onTwitterPressed,
            child: Container(
              height: 50,
              width: 50,
              padding: EdgeInsets.all(13),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: AppColors.labelColor),
              ),
              child: Image.asset('assets/images/twitter.png'),
            ),
          ),
          SizedBox(width: 20),
          GestureDetector(
            onTap: onFacebookPressed,
            child: Container(
              height: 50,
              width: 50,
              padding: EdgeInsets.all(13),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: AppColors.labelColor),
              ),
              child: Image.asset('assets/images/facebook.png'),
            ),
          ),
        ],
      ),
    );
  }
}
