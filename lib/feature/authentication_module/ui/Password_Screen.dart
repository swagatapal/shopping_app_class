import 'package:flutter/material.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {

  final TextEditingController _controller = TextEditingController();
  String password = "";

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
        Positioned(
          child: Image.asset("asset/image/pic7.png")
        ),
        /// 🔹 Light blue background
        Positioned(
          child: Image.asset("asset/image/pic8.png")
        ),

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
              style: TextStyle(color: Color(0xFF000000),fontSize: 19,fontWeight: FontWeight.w300),
            ),

            SizedBox(height: 15),

            /// 🔹 Password dots
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                8, (index) => Container(
                  margin: EdgeInsets.symmetric(horizontal: 6),
                  height: 12,
                  width: 12,
                  decoration: BoxDecoration(
                    color: index < password.length
                        ? Colors.red
                        : Color(0xFFE5EBFC),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),

            SizedBox(height: 25),
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
            /// Forgot password

            Spacer(),

            /// 🔹 Invisible TextField (keyboard input)
            SizedBox(
              height: 1,
              width: 1,
              child: TextField(
                controller: _controller,
                autofocus: true,
                obscureText: true,
                maxLength: 8,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
                decoration: const InputDecoration(
                  border: InputBorder.none,

                ),
              ),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Not you?",
                  style: TextStyle(color: Color(0xFF202020),
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
                      backgroundColor:Color(0xFF004CFF),
                      padding: EdgeInsets.zero,
                      shape: CircleBorder(),
                      elevation: 0,
                    ),
                    child:Icon(
                      Icons.arrow_forward,
                      size: 16,
                      color: Colors.white,
                    ),
                  ),
                ),

              ],
            ),
          ],
        ),
      ],
    );
  }
}
