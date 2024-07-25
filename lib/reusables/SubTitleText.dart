import 'package:flutter/cupertino.dart';

class SubTitleText extends StatelessWidget {
  String textData;
  SubTitleText({super.key,required this.textData});

  @override
  Widget build(BuildContext context) {
    return Text(textData,
    textAlign: TextAlign.center,
    style: TextStyle(

        color: Color(0xffA0A0A0),
      fontSize: 16,
      fontWeight: FontWeight.w500
    ),
    );
  }
}
