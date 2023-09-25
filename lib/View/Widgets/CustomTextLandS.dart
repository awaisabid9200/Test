import 'package:flutter/material.dart';

import '../Static/Colors.dart';

class CustomTextLandS extends StatelessWidget {
  final String text1;
  final String text2;
  final VoidCallback? onPressed; // Custom onPressed callback

  CustomTextLandS({
    required this.text1,
    required this.text2,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
          style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
        ),
        GestureDetector(
          onTap: onPressed, // Apply the custom onPressed action to the second Text
          child: Text(
            text2,
            style: TextStyle(color: AppColors.LandSColor, fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
