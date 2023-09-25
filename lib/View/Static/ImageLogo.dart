import 'package:flutter/material.dart';

class LogoImageContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 102,
      height: 119,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/icons/appIcon.png',),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
class CustomImage extends StatelessWidget {
  final String image;
  CustomImage({
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(image);
  }
}
