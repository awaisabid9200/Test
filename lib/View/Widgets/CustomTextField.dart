import 'package:flutter/material.dart';
import '../Static/Colors.dart';

class CustomInputField extends StatefulWidget {
  final String labelText;
  final String images;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType; // Add a keyboardType parameter

  CustomInputField({
    required this.labelText,
    required this.images,
    required this.controller,
    this.validator,
    this.keyboardType = TextInputType.text, // Default to TextInputType.text
  });

  @override
  _CustomInputFieldState createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  bool hasError = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              cursorColor: Colors.black,
              controller: widget.controller,
              validator: (value) {
                setState(() {
                  hasError = widget.validator?.call(value) != null;
                });
                return widget.validator?.call(value);
              },
              keyboardType: widget.keyboardType, // Use the keyboardType parameter
              decoration: InputDecoration(
                contentPadding:
                EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                prefixIcon: Image.asset(widget.images),
                hintText: widget.labelText,
                hintStyle: TextStyle(
                  color: AppColors.labelColor,
                  fontSize: 14,
                ),
                labelText: widget.labelText,
                floatingLabelStyle: TextStyle(
                  color: hasError ? Colors.red : AppColors.inputBorder,
                ),
                labelStyle: TextStyle(
                  color: AppColors.labelColor,
                  fontSize: 14,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: hasError ? Colors.red : AppColors.inputBorder,
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: hasError ? Colors.red : AppColors.inputBorder,
                  ),
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
