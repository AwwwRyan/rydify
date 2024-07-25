import 'package:flutter/material.dart';

class CustomGestureDetector extends StatelessWidget {
  final VoidCallback onTap;
  final String imagePath;

  CustomGestureDetector({
    required this.onTap,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFEAECF0), width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Image.asset(imagePath),
        ),
      ),
    );
  }
}
