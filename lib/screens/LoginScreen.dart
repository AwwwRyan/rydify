import 'package:authpages/reusables/CustomBlueButton.dart';
import 'package:authpages/reusables/CustomTextField.dart';
import 'package:authpages/reusables/PasswordTextField.dart';
import 'package:authpages/reusables/TitleText.dart';
import 'package:authpages/screens/SendVerificationScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../reusables/FooterSignup.dart';
import 'ForgetPasswordScreen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _numberEmailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _obscureText = true;
  bool _obscureTextConfirm = true;

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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 24, bottom: 24),
              child: TitleText(textData: "Log in"),
            ),
            CustomTextField(
                controller: _numberEmailController,
                hintText: "Email or Mobile Number"),
            PasswordTextField(
              controller: _passwordController,
              hintText: "Enter your Password",
              obscureText: _obscureText,
              onToggleVisibility: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: GestureDetector(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>  ForgetPasswordScreen()));
                    },
                    child: Text("Forget Password",style: TextStyle(fontSize: 16,color: Color(0xffF04438),fontWeight: FontWeight.w500),)),
              ),
            ),
            Center(child: Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: CustomBlueButton(onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>  SendVerificationScreen()));
              }, buttonText: "sign Up"),
            )),
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
