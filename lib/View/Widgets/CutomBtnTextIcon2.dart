import 'package:flutter/material.dart';

class CustomButtonIcon2 extends StatelessWidget {
  final String text;
  final Function() onPressed;

  CustomButtonIcon2({
    required this.text,
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
            SizedBox(width: 10,),
            Text(
              text,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Text color
              ),
            ),
            Icon(Icons.chevron_right_sharp,color: Colors.white),
          ],
        ),
      ),
    );
  }
}