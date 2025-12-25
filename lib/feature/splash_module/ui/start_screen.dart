import 'package:flutter/material.dart';
import 'package:shopping_app/feature/splash_module/ui/CreateAccount.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: startWidget(context),
    );
  }
}

  Widget startWidget(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 134,
              width: 134,
            ),
          Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              "asset/image/pic1.png.png"
            ), // background image
            Image.asset(
              "asset/image/pic2.png.png",
            ), // bag image
            ]
          ),
            SizedBox(height: 30),
            Text(
              "Shoppe",
              style: TextStyle(
                fontFamily: 'Raleway',
                color: Color(0xFF202020),
                fontSize: 52,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12),
            Text(
              "Beautiful eCommerce UI Kit\nfor your online store",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'NunitoSans',
                fontWeight: FontWeight.w300,
                fontSize: 19,
                color: Color(0xFF202020),
              ),
            ),
            SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF004CFF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CreateAccount()),
                  );
                },
                child: Text(
                  "Let's get started",
                  style: TextStyle(
                    fontFamily: 'NunitoSans',
                    fontSize: 22,
                    fontWeight: FontWeight.w300,
                    color: Color(0xFFF3F3F3),
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "I already have an account",
                  style: TextStyle(color: Color(0xFF202020),
                    fontFamily: 'NunitoSans',
                    fontWeight: FontWeight.w300,
                    fontSize: 15,
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Color(0xFF004CFF),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(Icons.arrow_forward,
                      size: 16,
                      color: Color(0xFFFFFFFF),),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }


