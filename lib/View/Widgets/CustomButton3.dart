import 'package:flutter/material.dart';

class CustomButton3 extends StatelessWidget {
  final String text;
  final Function() onPressed;

  CustomButton3({
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width:259, // Button expands to fill the available width
      height: 48.0, // Set the desired button height
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            primary: Color(0XffEC5B45),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0), // Set border radius
            ),
            elevation: 5,
            shadowColor: Colors.grey.shade400
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.white, // Text color
          ),
        ),
      ),
    );
  }
}