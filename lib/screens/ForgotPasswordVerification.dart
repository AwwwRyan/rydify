import 'package:authpages/screens/WelcomeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../reusables/CustomBlueButton.dart';
import '../reusables/PinputVerification.dart';
import '../reusables/SubTitleText.dart';
import '../reusables/TitleText.dart';
import 'SetNewPasswordScreen.dart';
import 'SetPasswordScreen.dart';

class ForgotPasswordVerification extends StatefulWidget {
  const ForgotPasswordVerification({super.key});

  @override
  State<ForgotPasswordVerification> createState() => _ForgotPasswordVerificationState();
}

class _ForgotPasswordVerificationState extends State<ForgotPasswordVerification> {
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
              child: TitleText(textData: "Forgot Password"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: SubTitleText(textData: "Code has been sent to 094862039"),
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
                    MaterialPageRoute(builder: (context) =>  SetNewPasswordScreen()));
              }, buttonText: "Verify"),
            )
          ],
        )
    );
  }
}
