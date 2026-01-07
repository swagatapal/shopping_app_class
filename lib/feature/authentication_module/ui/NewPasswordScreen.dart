import 'package:flutter/material.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController repeatPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: newPasswordWidget(),
    );
  }

  // 🔹 Main Widget
  Widget newPasswordWidget() {
    return Column(
      children: [
        Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                "asset/image/pic12.png",
              ),
            ),

            Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                "asset/image/pic13.png",
              ),
            ),
          ],
        ),
        // 👤 Avatar
            CircleAvatar(
              radius: 55, // outer size
              backgroundColor: Color(0xFFFFFFFF), // white ring
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 60, // inner circle
                child: ClipOval(
                  child: Image.asset(
                    'asset/image/pic11.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Setup New Password",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            const Text(
              "Please, setup a new password for\nyour account",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 30),

            // 🔑 New Password
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: newPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "New Password",
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 15),

            // 🔁 Repeat Password
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: repeatPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Repeat Password",
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            SizedBox(height: 150,),

            // 💾 Save Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: GestureDetector(
                onTap: () {
                  _onSavePressed();
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color(0xFF0D47FF),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    "Save",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 15),

        Center(
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text(
              "Cancel",
              style: TextStyle(
                  color: Color(0xFF202020),
                  fontSize: 15,
                  fontFamily: 'NunitoSans',
                  fontWeight: FontWeight.w300),
            ),
          ),
        ),

            const SizedBox(height: 25),

      ],
    );

  }

  // 🔐 Save Button Logic
  void _onSavePressed() {
    String newPass = newPasswordController.text.trim();
    String repeatPass = repeatPasswordController.text.trim();

    if (newPass.isEmpty || repeatPass.isEmpty) {
      _showMessage("Please fill all fields");
      return;
    }

    if (newPass != repeatPass) {
      _showMessage("Passwords do not match");
      return;
    }

    // ✅ Navigate to next screen
    Navigator.pushNamed(context, "/HelloCard");
  }

  void _showMessage(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg)),
    );
  }
}

//////////////////////////////////////////////////
// 🔜 NEXT SCREEN AFTER SAVE
//////////////////////////////////////////////////


