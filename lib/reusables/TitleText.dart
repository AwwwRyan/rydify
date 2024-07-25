import 'dart:io';
import 'package:flutter/cupertino.dart';

class TitleText extends StatelessWidget {
  String textData;
  TitleText({super.key,
  required this.textData});

  @override
  Widget build(BuildContext context) {
    return Text(textData,
    style: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w500 ,
    ),);
  }
}
