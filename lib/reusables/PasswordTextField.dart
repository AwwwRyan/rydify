import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PasswordTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final VoidCallback onToggleVisibility;

  const PasswordTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.onToggleVisibility,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16.0),
      child: TextField(
        style: TextStyle(
          fontSize: 18.0,
          color: Color(0xFF98A2B3),
          fontWeight: FontWeight.w500,
        ),
        controller: controller,
        cursorColor: Color(0xFF98A2B3),
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Color(0xFF98A2B3), fontSize: 18),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: Color(0xFFEAECF0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: Color(0xFFEAECF0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: Color(0xFFEAECF0)),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              obscureText ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
              color: Color(0xFF98A2B3),
            ),
            onPressed: onToggleVisibility,
          ),
        ),
      ),
    );
  }
}