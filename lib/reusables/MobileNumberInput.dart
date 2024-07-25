import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';

class MobileNumberInput extends StatefulWidget {
  final TextEditingController controller;
  final Function(String) onCountryCodeChanged;

  const MobileNumberInput({
    Key? key,
    required this.controller,
    required this.onCountryCodeChanged,
  }) : super(key: key);

  @override
  _MobileNumberInputState createState() => _MobileNumberInputState();
}

class _MobileNumberInputState extends State<MobileNumberInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Color(0xFFEAECF0)),
      ),
      child: Row(
        children: [
          CountryCodePicker(
            onChanged: (countryCode) {
              widget.onCountryCodeChanged(countryCode.dialCode!);
            },
            textStyle: TextStyle(fontSize: 18, color: Colors.black),
          ),
          Expanded(
            child: TextField(
              keyboardType: TextInputType.number,
              controller: widget.controller,
              cursorColor: Color(0xFF98A2B3),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Your mobile number',
                hintStyle: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF98A2B3),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 12),
              ),
              style: const TextStyle(
                fontSize: 18.0,
                color: Color(0xFF98A2B3),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
