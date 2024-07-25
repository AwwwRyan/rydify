import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../reusables/SignUpIcons.dart';

class FooterSignup extends StatelessWidget {
  final VoidCallback onSignInTap;

  const FooterSignup({Key? key, required this.onSignInTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 18.0),
            child: Text(
              "or",
              style: TextStyle(fontSize: 20, color: Color(0xff98A2B3)),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomGestureDetector(
              onTap: () {},
              imagePath: "assets/welcomescreen/Gmail.png",
            ),
            CustomGestureDetector(
              onTap: () {},
              imagePath: "assets/welcomescreen/Facebook.png",
            ),
            CustomGestureDetector(
              onTap: () {},
              imagePath: "assets/welcomescreen/Apple.png",
            ),
          ],
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: RichText(
              text: TextSpan(
                text: "Already have an account? ",
                style: TextStyle(fontSize: 14, color: Color(0xff667085)),
                children: [
                  TextSpan(
                    text: "Sign In",
                    style: TextStyle(color: Color(0xff036683)),
                    recognizer: TapGestureRecognizer()..onTap = onSignInTap,
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
