import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../WelcomeScreen.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int _currentPage = 0;
  final List<OnboardingData> _pages = [
    OnboardingData(
      image: 'assets/onboardingscreen/Anywhereyouare.png',
      title: 'Anywhere You Are',
      description: 'Sell houses easily with the help of Listenoryx and to make this line big \nI am writing more.',
    ),
    OnboardingData(
      image: 'assets/onboardingscreen/Atanytime.png',
      title: 'At Anytime',
      description: 'Sell houses easily with the help of Listenoryx and to make this line big I am writing more.',
    ),
    OnboardingData(
      image: 'assets/onboardingscreen/Frames.png',
      title: 'Book Your Cab With Rydify',
      description: 'Sell houses easily with the help of Listenoryx and to make this line big I am writing more.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => WelcomeScreen()),
                ),
                child: Text('Skip',style: TextStyle(fontSize: 18,color: Colors.black),),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(28.0),
                    child: Image.asset(_pages[_currentPage].image),
                  ),
                  SizedBox(height: 12),
                  Text(
                    _pages[_currentPage].title,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500 ,
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      _pages[_currentPage].description,
                      textAlign: TextAlign.center,
                      style:  TextStyle(
                          color: Color(0xffA0A0A0),
                          fontSize: 18,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CircularPercentIndicator(
              radius: 60.0,
              lineWidth: 8.0,
              percent: (_currentPage + 1) / _pages.length,
              center: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Color(0xff036683),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 5),
                ),
                child: Center(
                  child: _currentPage < 2
                      ? IconButton(
                          icon: Icon(Icons.arrow_forward, color: Colors.white),
                          onPressed: _nextPage,
                        )
                      : TextButton(
                          child: Text('Go!', style: TextStyle(color: Colors.white,fontSize: 18)),
                          onPressed: _nextPage,
                        ),
                ),
              ),
              progressColor: Color(0xff036683),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      setState(() {
        _currentPage++;
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WelcomeScreen()),
      );
    }
  }
}

class OnboardingData {
  final String image;
  final String title;
  final String description;

  OnboardingData({required this.image, required this.title, required this.description});
}