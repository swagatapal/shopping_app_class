import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  bool _isPasswordHidden = true;

  Country _selectedCountry = Country.parse('GB'); // default 🇬🇧

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          topBackgroundShape(),
          createAccountBody(),
        ],
      ),
    );
  }

  // ================= BACKGROUND DESIGN (UNCHANGED) =================
  Widget topBackgroundShape() {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          child: Image.asset("asset/image/pic4.png"),
        ),
        Positioned(
          top: 30,
          right: 0,
          child: Image.asset("asset/image/pic5.png"),
        ),
      ],
    );
  }

  // ================= MAIN CONTENT (UNCHANGED) =================
  Widget createAccountBody() {
    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 80),

            Text(
              "Create\nAccount",
              style: TextStyle(
                fontSize: 45,
                fontFamily: "Raleway",
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 30),

            Image.asset("asset/image/pic6.png"),

            SizedBox(height: 25),

            inputField("Email"),

            SizedBox(height: 15),

            passwordField(),

            SizedBox(height: 15),

            phoneInputField(), // 👈 ONLY THIS IS MODIFIED

            SizedBox(height: 65),

            doneButton(),

            SizedBox(height: 15),

            Center(
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Cancel",
                  style: TextStyle(color: Color(0xFF202020), fontSize: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ================= EMAIL FIELD =================
  Widget inputField(String hint) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.grey.shade100,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(59.29),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  // ================= PASSWORD FIELD =================
  Widget passwordField() {
    return TextField(
      obscureText: _isPasswordHidden,
      decoration: InputDecoration(
        hintText: "Password",
        suffixIcon: IconButton(
          icon: Icon(
            _isPasswordHidden ? Icons.visibility_off : Icons.visibility,
          ),
          onPressed: () {
            setState(() {
              _isPasswordHidden = !_isPasswordHidden;
            });
          },
        ),
        filled: true,
        fillColor: Colors.grey.shade100,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(59.29),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  // ================= PHONE FIELD (FLAG PICKER ADDED) =================
  Widget phoneInputField() {
    return TextField(
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        prefixIcon: InkWell(
          onTap: () {
            showCountryPicker(
              context: context,
              showPhoneCode: true,
              onSelect: (Country country) {
                setState(() {
                  _selectedCountry = country;
                });
              },
            );
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(width: 12),
              Text(
                _selectedCountry.flagEmoji,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(width: 6),
              Icon(Icons.keyboard_arrow_down),
              SizedBox(width: 8),
            ],
          ),
        ),
        hintText: "Your number",
        filled: true,
        fillColor: Colors.grey.shade100,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(59.29),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  // ================= DONE BUTTON =================
  Widget doneButton() {
    return SizedBox(
      width: double.infinity,
      height: 61,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0XFF004CFF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, "/HelloCard");
        },
        child: Text(
          "Done",
          style: TextStyle(
            fontSize: 22,
            color: Color(0xFFF3F3F3),
          ),
        ),
      ),
    );
  }
}
