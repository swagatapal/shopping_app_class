import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: Stack(children: [
        bgContainer(),
        foregroundElement(),
      
      ]),
    );
  }

  Widget bgContainer() {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(children: [
            Image.asset("asset/image/pic7.png"),
            Image.asset("asset/image/pic8.png")
          ]),
          Align(
              alignment: Alignment.centerRight,
              child: Image.asset("asset/image/pic9.png")),
          // Spacer(),
          // Align(
          //     alignment: Alignment.centerRight,
          //     child: Image.asset("asset/image/pic10.png")),
        ],
      ),
    );
  }

  Widget foregroundElement(){
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 400,),
            Center(
              child: Text(
                "Login",
                style: TextStyle(
                    fontSize: 52,
                    fontFamily: "Raleway",
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF202020)),
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
                  Navigator.pushNamed(context, "/PasswordScreen");
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
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Cancel",
                  style: TextStyle(
                      color: Color(0xFF202020),
                      fontSize: 15,
                      fontWeight: FontWeight.w300),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
