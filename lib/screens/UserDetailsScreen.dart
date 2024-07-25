import 'dart:io';
import 'package:authpages/reusables/CustomTextField.dart';
import 'package:authpages/reusables/MobileNumberInput.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({super.key});

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();

  String _selectedCountryCode = '+1';

  final ImagePicker _picker = ImagePicker();
  File? _pickedImage;

  Future<void> _pickMedia() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _pickedImage = File(pickedFile.path);
      });
    }
  }

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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            GestureDetector(
              onTap: _pickMedia,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[300],
                      image: _pickedImage != null
                          ? DecorationImage(
                        image: FileImage(_pickedImage!),
                        fit: BoxFit.cover,
                      )
                          : null,
                    ),
                  ),
                  Positioned(
                    bottom: 2,
                    right: 2,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff036683),
                      ),
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 22.0,bottom: 3),
              child: CustomTextField(controller: _nameController, hintText: "Full Name"),
            ),
            MobileNumberInput(
              controller: _numberController,
              onCountryCodeChanged: (String countryCode) {
                setState(() {
                  _selectedCountryCode = countryCode;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 22.0,top: 3),
              child: CustomTextField(
                  controller: _emailController, hintText: "Email"),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 22.0),
              child: CustomTextField(
                  controller: _streetController, hintText: "Street"),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 22.0),
              child: CustomTextField(
                controller: _cityController,
                hintText: "City",
                suffixIcon: IconButton(
                  icon: const Icon(Icons.arrow_drop_down),
                  onPressed: () {},
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 22.0),
              child: CustomTextField(
                controller: _districtController,
                hintText: "District",
                suffixIcon: IconButton(
                  icon: const Icon(Icons.arrow_drop_down),
                  onPressed: () {},
                ),
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.42,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {},
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
                      'Skip For Now',
                      style: TextStyle(
                        color: Color(0xFF036683),
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.42,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color(0xFF036683), // Text color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8), // Rounded corners
                      ),
                      elevation: 0, // No shadow
                    ),
                    child: const Text(
                      "Save",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}