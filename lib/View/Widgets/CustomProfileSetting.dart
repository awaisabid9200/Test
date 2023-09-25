
import 'package:flutter/material.dart';

import '../Static/Colors.dart';

class CustomProfileList extends StatelessWidget {
  final String imagePath;
  final String customText;

  CustomProfileList({
    required this.imagePath,
    required this.customText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: 315,
      margin: EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            spreadRadius: 0,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.box,
                  ),
                  child: Image.asset(
                    imagePath,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  customText,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Icon(
              Icons.chevron_right_sharp,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
