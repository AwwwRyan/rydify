import 'package:authpages/reusables/CustomBlueButton.dart';
import 'package:authpages/screens/ForgetPasswordScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../reusables/CustomTextField.dart';
import '../reusables/TitleText.dart';

class SendVerificationScreen extends StatefulWidget {
  const SendVerificationScreen({super.key});

  @override
  State<SendVerificationScreen> createState() => _SendVerificationScreenState();
}

class _SendVerificationScreenState extends State<SendVerificationScreen> {
  final TextEditingController _numberEmailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 24, bottom: 24),
            child: TitleText(textData: "Verification email or phone \nnumber"),
          ),
          CustomTextField(
              controller: _numberEmailController,
              hintText: "Email or Mobile Number"),
          Spacer(),
          Center(child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: CustomBlueButton(onPressed: (){}, buttonText: "Send OTP"),
          )),
        ],
      ),
    );
  }
}
