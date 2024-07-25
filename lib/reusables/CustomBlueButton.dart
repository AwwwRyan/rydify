import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBlueButton extends StatelessWidget {
   VoidCallback onPressed;
   String buttonText;
   CustomBlueButton({super.key, required this.onPressed, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      height: 60,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Color(0xFF036683), // Text color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), // Rounded corners
          ),
          elevation: 0, // No shadow
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,fontWeight: FontWeight.w400
          ),
        ),
      ),
    );
  }
}
