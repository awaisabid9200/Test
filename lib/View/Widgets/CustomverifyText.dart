import 'package:flutter/material.dart';

class CustomTextVerify extends StatelessWidget {
  final String text;

  CustomTextVerify({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color:  Color(0xFF171433),
        fontWeight: FontWeight.w500,
        fontSize:14,
      ),
      textAlign:TextAlign.center,
    );
  }
}
