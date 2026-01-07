import 'package:flutter/material.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _controller = TextEditingController();
  String password = "";
  FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: passwordBody(), // 👉 calling separate widget
      ),
    );
  }

  /// 🔹 Password UI widget
  Widget passwordBody() {
    return Stack(
      children: [
        /// 🔹 Blue background circle
        Image.asset("asset/image/pic7.png"),

        /// 🔹 Light blue background
        Image.asset("asset/image/pic8.png"),

        /// 🔹 Main content
        Column(
          children: [
            SizedBox(height: 156),
            CircleAvatar(
              radius: 55, // outer size
              backgroundColor: Colors.white, // white ring
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

            SizedBox(height: 20),

            /// Greeting text
            Text(
              "Hello, Romina!!",
              style: TextStyle(
                fontSize: 28,
                fontFamily: "Raleway",
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 15),

            Text(
              "Type your password",
              style: TextStyle(
                  color: Color(0xFF000000),
                  fontSize: 19,
                  fontWeight: FontWeight.w300),
            ),

            SizedBox(height: 15),

            /// 🔹 Password dots

            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  6,
                  (index) => InkWell(
                    onTap: () {
                      FocusScope.of(context).requestFocus(_focusNode);
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 6),
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: index < password.length
                            ? Colors.red
                            : const Color(0xFFE5EBFC),
                        shape: BoxShape.circle,
                      ),
                      child: index < password.length
                          ? const Icon(Icons.circle,
                              size: 10, color: Colors.white)
                          : null,
                    ),
                  ),
                ),
              ),


            TextField(
              controller: _controller,
              focusNode: _focusNode,
              autofocus: true,
              keyboardType: TextInputType.number,
              obscureText: true,
              maxLength: 6,
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
              decoration: const InputDecoration(
                border: InputBorder.none,
                counterText: "",
              ),
              style: const TextStyle(color: Colors.transparent),
              cursorColor: Colors.transparent,
            ),

            InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/PasswordRecovery");
              },
              child: const Text(
                "Forgot your password?",
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                ),
              ),
            ),
            Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Not you?",
                  style: TextStyle(
                    color: Color(0xFF202020),
                    fontFamily: 'NunitoSans',
                    fontWeight: FontWeight.w300,
                    fontSize: 15,
                  ),
                ),
                SizedBox(width: 8),
                SizedBox(
                  height: 30,
                  width: 30,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/HelloCard");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF004CFF),
                      padding: EdgeInsets.zero,
                      shape: CircleBorder(),
                      elevation: 0,
                    ),
                    child: Icon(
                      Icons.arrow_forward,
                      size: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 20,
            ),
          ],
        ),
      ],
    );
  }
}
