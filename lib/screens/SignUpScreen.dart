import 'package:authpages/reusables/CustomBlueButton.dart';
import 'package:authpages/reusables/TitleText.dart';
import 'package:authpages/screens/PhoneVerificationScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../reusables/CustomTextField.dart';
import '../reusables/FooterSignup.dart';
import '../reusables/MobileNumberInput.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  String? _selectedGender;
  String _selectedCountryCode = '+1'; // Default country code

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TitleText(textData: "Sign Up"),
            ),
            CustomTextField(controller: _nameController, hintText: 'Name'),
            SizedBox(
              height: 16,
            ),
            CustomTextField(controller: _emailController, hintText: 'Email'),
            //mobile
            //mobile
            MobileNumberInput(
              controller: _mobileController,
              onCountryCodeChanged: (String countryCode) {
                setState(() {
                  _selectedCountryCode = countryCode;
                });
              },
            ),
            //gender
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: DropdownButtonFormField<String>(
                value: _selectedGender,
                items: ['Male', 'Female', 'Other']
                    .map((gender) => DropdownMenuItem(
                          child: Text(
                            gender,
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Color(0xFF98A2B3),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          value: gender,
                        ))
                    .toList(),
                decoration: InputDecoration(
                  hintText: 'Gender',
                  hintStyle: TextStyle(
                    color: Color(0xFF98A2B3),
                    fontSize: 18,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: Color(0xFFEAECF0),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: Color(0xFFEAECF0),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: Color(0xFFEAECF0),
                    ),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value;
                  });
                },
              ),
            ),
            //privacy poicy
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 28),
                child: Row(
                  children: [
                    Image.asset("assets/welcomescreen/checkcircle.png"),
                    SizedBox(width: 10),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          text: "By signing up, you agree to the ",
                          style: TextStyle(fontSize: 12, color: Colors.black),
                          children: [
                            TextSpan(
                              text: "Terms of service",
                              style: TextStyle(color: Color(0xff036683)),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  print("Terms of Service tapped");
                                },
                            ),
                            TextSpan(
                              text: " and ",
                            ),
                            TextSpan(
                              text: "Privacy policy.",
                              style: TextStyle(color: Color(0xff036683)),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  print("Privacy Policy tapped");
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
            Center(
                child: CustomBlueButton(onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>  PhoneVerificationScreen()));
                }, buttonText: "Sign Up")),
            FooterSignup(
              onSignInTap: () {
                print("Sign In tapped");
                // Add navigation to sign in screen here
              },
            ),
          ],
        ),
      ),
    );
  }
}