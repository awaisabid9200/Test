
import 'package:flutter/material.dart';

import '../Static/Colors.dart';

class CustomCheckboxWithText extends StatefulWidget {
  final String text;
  final String text1;
  final String text3;
  final String text2;
  final bool initialValue;
  final Function(bool) onChanged;

  CustomCheckboxWithText({
    required this.text,
    required this.text1,
    required this.text3,
    required this.text2,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  _CustomCheckboxWithTextState createState() => _CustomCheckboxWithTextState();
}

class _CustomCheckboxWithTextState extends State<CustomCheckboxWithText> {
  bool _isChecked = false;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 315,
      child: Row(
        children: [
          Checkbox(
            value: _isChecked,
            checkColor: Colors.green,
            activeColor: Colors.white,
            onChanged: (newValue) {
              setState(() {
                _isChecked = newValue!;
                widget.onChanged(newValue);
              });
            },
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: widget.text,
                  style: TextStyle(
                    color:AppColors.labelColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
                TextSpan(
                  text: widget.text1,
                  style: TextStyle(
                    color:Colors.red,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
                TextSpan(
                  text: widget.text2,
                  style: TextStyle(
                    color: AppColors.labelColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
                TextSpan(
                  text: '\n',
                ),
                TextSpan(
                  text: widget.text3,
                  style: TextStyle(
                    color:Colors.red,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

