import 'package:flutter/material.dart';
import '../reusables/CustomBlueButton.dart';
import '../reusables/SubTitleText.dart';
import '../reusables/TitleText.dart';
import 'LoginScreen.dart';
import 'SignUpScreen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 120),
          Center(child: Image.asset("assets/welcomescreen/WelcomeScreen.png")),
          const SizedBox(height: 28),
          TitleText(textData: "Welcome"),
          SubTitleText(textData: 'Have a better sharing experience'),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 28),
            child: Column(
              children: [
                // Create an account button
                CustomBlueButton(onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()));
                }, buttonText: "Create an Account"),
                const SizedBox(height: 28),
                // Login button
                Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>  LoginScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white, // Text color
                      side: const BorderSide(color: Color(0xFF036683), width: 1), // Border color and width
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8), // Rounded corners
                      ),
                      elevation: 0, // Shadow elevation
                    ),
                    child: const Text(
                      'Log In',
                      style: TextStyle(
                        color: Color(0xFF036683),
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
