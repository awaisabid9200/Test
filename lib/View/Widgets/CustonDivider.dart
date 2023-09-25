import '../Static/Colors.dart';
import 'package:flutter/material.dart';

class TextWithDivider extends StatelessWidget {
  final String text;

  TextWithDivider({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 315,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Divider(
              color:AppColors.labelColor,
              thickness: 0.5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Divider(
              color:AppColors.labelColor,
              thickness:0.5,
            ),
          ),
        ],
      ),
    );
  }
}
