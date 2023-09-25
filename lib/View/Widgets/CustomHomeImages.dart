import 'package:flutter/material.dart';

class CustomCircularImage extends StatelessWidget {
  final String image;
  final double size;
  final Color borderColor;
  final double borderWidth;

  CustomCircularImage({
    required this.image,
    required this.size,
    required this.borderColor,
    required this.borderWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: borderWidth,
        ),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
