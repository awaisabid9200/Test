import 'package:flutter/material.dart';

import 'Colors.dart';


class CustomBottomAppBar extends StatefulWidget {
  @override
  _CustomBottomAppBarState createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10,right: 10),
      decoration: BoxDecoration(
        color: Colors.white, // Set the background color to white
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: BottomAppBar(
        elevation: 0,
        color: Colors.white,
        height: 60,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildNavItem(0, 'assets/icons/Home.png'), // Use image paths here
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: _buildNavItem(1, 'assets/icons/Video.png'),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: _buildNavItem(2, 'assets/icons/Camera.png'),
            ),
            _buildNavItem(3, 'assets/icons/Profile.png'),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, String imagePath) {
    final isSelected = index == _selectedIndex;
    final bgColor = isSelected ? AppColors.navcolor : Colors.transparent;

    return GestureDetector(
      onTap: () {
        _onItemTapped(index);
        // Add your navigation logic here
      },
      child: Container(
        width: 40, // Adjust the width and height as needed
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: bgColor,
        ),
        child: Image.asset(
          imagePath,
          color: isSelected ? Colors.white : AppColors.labelColor,
        ),
      ),
    );
  }
}

class CustomFloatingActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60, // Set the width and height to create a circular shape
      height: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.red, // Customize the background color of the FAB
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Image.asset('assets/icons/diet.png'),
    );
  }
}
