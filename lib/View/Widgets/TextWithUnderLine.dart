import '../Static/Colors.dart';
import 'package:flutter/material.dart';

class TextUndeLine extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  TextUndeLine({
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: AppColors.LandSColor,
            ),
          ),
          Container(
            height: 2,
            width: 90,
            color: AppColors.LandSColor,
          ),
        ],
      ),
    );
  }
}
