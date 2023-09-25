import 'package:flutter/material.dart';
import '../Static/Colors.dart';

class CustomInputField extends StatelessWidget {
  final String labelText;
  final String images;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  CustomInputField({
    required this.labelText,
    required this.images,
    required this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final errorText = validator != null ? validator!(controller.text) : null;

    return Row(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              height: 48,
              width: 315,
              child: TextFormField(
                cursorColor: Colors.black,
                controller: controller,
                validator: validator,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: AppColors.inputBorder), //<-- SEE HERE
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                    focusedBorder: OutlineInputBorder( //<-- SEE HERE
                      borderSide: BorderSide(
                          width: 1, color:AppColors.inputBorder),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  prefixIcon: Image.asset(images),
                  hintText: '$labelText',
                  hintStyle: TextStyle(
                    color: AppColors.labelColor,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
