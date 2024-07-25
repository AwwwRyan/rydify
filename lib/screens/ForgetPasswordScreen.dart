import 'package:authpages/reusables/CustomBlueButton.dart';
import 'package:authpages/reusables/SubTitleText.dart';
import 'package:authpages/reusables/TitleText.dart';
import 'package:authpages/screens/ForgotPasswordVerification.dart';
import 'package:authpages/screens/SetNewPasswordScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final String phoneNumber = "+1234 983270";
  final String email = "xdwsrhrdyz@xyz.com";
  String? selectedOption;

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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 24, bottom: 14),
            child: Center(child: TitleText(textData: "Forgot Password")),
          ),
          SubTitleText(textData: "Select which contact details should we use \nto reset your password"),
          const SizedBox(height: 24),
          _buildOptionContainer(
            icon: Icons.message,
            title: "Via SMS",
            value: _obscurePhoneNumber(phoneNumber),
            isSelected: selectedOption == "sms",
            onTap: () => setState(() => selectedOption = "sms"),
          ),
          const SizedBox(height: 16),
          _buildOptionContainer(
            icon: Icons.email,
            title: "Via Email",
            value: _obscureEmail(email),
            isSelected: selectedOption == "email",
            onTap: () => setState(() => selectedOption = "email"),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 32.0),
            child: CustomBlueButton(
              onPressed: () {
                if (selectedOption != null) {
                  print(selectedOption == "sms" ? phoneNumber : email);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>  ForgotPasswordVerification()));
                }
              },
              buttonText: "Continue",
            ),
          )
        ],
      ),
    );
  }

  Widget _buildOptionContainer({
    required IconData icon,
    required String title,
    required String value,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFF0F8FB),
          borderRadius: BorderRadius.circular(8),
          border: isSelected
              ? Border.all(color: const Color(0xFF5799AC), width: 1.5)
              : null,
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFF5799AC)),
              ),
              child: Icon(icon, color: const Color(0xFF5799AC),size: 20,),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: Color(0xFF667085))),
                Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _obscurePhoneNumber(String phone) {
    return phone.replaceRange(0, phone.length - 3, '*' * (phone.length - 3));
  }

  String _obscureEmail(String email) {
    final parts = email.split('@');
    return '${parts[0][0]}${'*' * (parts[0].length - 1)}@${parts[1]}';
  }
}