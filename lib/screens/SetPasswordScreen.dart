import 'package:authpages/reusables/CustomBlueButton.dart';
import 'package:authpages/screens/UserDetailsScreen.dart';
import 'package:authpages/screens/WelcomeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../reusables/PasswordTextField.dart';
import '../reusables/SubTitleText.dart';
import '../reusables/TitleText.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({super.key});

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _obscureText = true;
  bool _obscureTextConfirm = true;
  String _errorMessage = "";

  void _validatePassword() {
    setState(() {
      _errorMessage = ""; // Clear previous errors
      String password = _passwordController.text;

      if (password.length < 8) {
        _errorMessage = "Password must be at least 8 characters long.";
      } else if (!RegExp(r'[0-9]').hasMatch(password)) {
        _errorMessage = "Password must contain at least one number.";
      } else if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password)) {
        _errorMessage = "Password must contain at least one special character.";
      } else if (password != _confirmPasswordController.text) {
        _errorMessage = "Passwords do not match.";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) =>  WelcomeScreen()));
          },
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(CupertinoIcons.back, color: Color(0xff667085)),
              Text(
                "Back",
                style: TextStyle(color: Color(0xff667085), fontSize: 16),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: TitleText(textData: "Set Password"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: SubTitleText(textData: "Set your password"),
            ),
            SizedBox(
              height: 20,
            ),
            PasswordTextField(
              controller: _passwordController,
              hintText: "Enter Your Password",
              obscureText: _obscureText,
              onToggleVisibility: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
            PasswordTextField(
              controller: _confirmPasswordController,
              hintText: "Confirm Your Password",
              obscureText: _obscureTextConfirm,
              onToggleVisibility: () {
                setState(() {
                  _obscureTextConfirm = !_obscureTextConfirm;
                });
              },
            ),

            //error message
            if (_errorMessage.isNotEmpty)
              Text(
                _errorMessage,
                style: TextStyle(color: Color(0xff98A2B3),fontSize: 18),
              ),Spacer(),

            //register button
            Padding(
              padding: const EdgeInsets.only(bottom:  16.0),
              child: CustomBlueButton(onPressed: () {
                _validatePassword();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>  UserDetailsScreen()));
              }, buttonText: "Register"),
            ),
          ],
        ),
      ),
    );
  }
}