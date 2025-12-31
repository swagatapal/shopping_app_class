import 'package:flutter/material.dart';

class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: loginBody(context),
    );
  }
}

/// 🔹 Login UI Widget
Widget loginBody(BuildContext context) {
  return SafeArea(
    child: Stack(
      children: [

        /// 🔵 Background shapes (NOT interactive)
        Positioned(
          child: Image.asset("asset/image/pic7.png"),
        ),

        Positioned(
          child: Image.asset("asset/image/pic8.png"),
        ),

        Positioned(
          right: 0,
          top: 239.24,
          child: Image.asset("asset/image/pic9.png"),
        ),

        Positioned(
          top: 449.48,
          left: 145,
          child: Image.asset("asset/image/pic10.png"),
        ),

        /// 🔹 Content (ONLY email is input)
        SingleChildScrollView(
          child: Padding(
            padding:EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 438),
                Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 52,
                    fontFamily: "Raleway",
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF202020)
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Good to see you back! ❤",
                  style: TextStyle(
                    fontSize: 19,
                    color: Color(0xFF202020),
                  ),
                ),
                SizedBox(height: 30),
                TextField(
                  // keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "Email",
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 16,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(59.12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                SizedBox(height: 25),
                SizedBox(
                  width: double.infinity,
                  height: 61,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF004CFF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, "/passwordScreen");
                    },
                    child: const Text(
                      "Next",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 16),
                Center(
                  child: Text(
                    "Cancel",
                    style: TextStyle(color: Color(0xFF202020),fontSize: 15,fontWeight:FontWeight.w300),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}