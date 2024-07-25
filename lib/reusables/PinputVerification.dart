import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class PinputVerification extends StatelessWidget {
  final TextEditingController otpController;
  final VoidCallback onResendTap;

  const PinputVerification({
    Key? key,
    required this.otpController,
    required this.onResendTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20),
          child: Pinput(
            controller: otpController,
            length: 6,
            defaultPinTheme: PinTheme(
              width: 56,
              height: 56,
              textStyle: TextStyle(fontSize: 30, color: Colors.black),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Color(0xffEAECF0)),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            focusedPinTheme: PinTheme(
              width: 56,
              height: 56,
              textStyle: TextStyle(fontSize: 30, color: Colors.black),
              decoration: BoxDecoration(
                color: Color(0xffF0F8FB),
                border: Border.all(color: Color(0xff5799AC)),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        RichText(
          text: TextSpan(
            text: "Didn't receive code? ",
            style: TextStyle(fontSize: 14, color: Color(0xff667085)),
            children: [
              TextSpan(
                text: "Resend again",
                style: TextStyle(color: Color(0xff036683)),
                recognizer: TapGestureRecognizer()..onTap = onResendTap,
              )
            ],
          ),
        ),
      ],
    );
  }
}
