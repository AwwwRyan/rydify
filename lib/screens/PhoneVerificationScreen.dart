import 'package:authpages/reusables/CustomBlueButton.dart';
import 'package:authpages/reusables/SubTitleText.dart';
import 'package:authpages/reusables/TitleText.dart';
import 'package:authpages/screens/SetPasswordScreen.dart';
import 'package:authpages/screens/WelcomeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../reusables/PinputVerification.dart';

class PhoneVerificationScreen extends StatefulWidget {
   PhoneVerificationScreen({super.key});

  @override
  State<PhoneVerificationScreen> createState() => _PhoneVerificationScreenState();
}

class _PhoneVerificationScreenState extends State<PhoneVerificationScreen> {
  final otpcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
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
      body :
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: TitleText(textData: "Phone Verification"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: SubTitleText(textData: "Enter your OTP code"),
            ),
            SizedBox(height: 20,),
            PinputVerification(
              otpController: otpcontroller,
              onResendTap: () {
                print("Resend again tapped");
              },
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 18.0),
              child: CustomBlueButton(onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>  SetPasswordScreen()));
              }, buttonText: "Verify"),
            )
          ],
        )
    );
  }
}