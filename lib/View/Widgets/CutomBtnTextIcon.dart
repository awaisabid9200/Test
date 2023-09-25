import 'package:flutter/material.dart';

class CustomButtonIcon extends StatelessWidget {
  final String text;
  final String image;
  final Function() onPressed;

  CustomButtonIcon({
    required this.text,
    required this.image,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width:315, // Button expands to fill the available width
      height: 60.0, // Set the desired button height
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: Color(0XffEC5B45),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0), // Set border radius
          ),
          elevation: 5, // Add shadow
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image),
            SizedBox(width: 10,),
            Text(
              text,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Text color
              ),
            ),
          ],
        ),
      ),
    );
  }
}