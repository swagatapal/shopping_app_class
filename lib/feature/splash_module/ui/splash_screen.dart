import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          centerLogo(),
          textWidget(),
        ],
      ),
    );
  }

  Widget centerLogo() {
    return SizedBox(child: Image.network("https://img.freepik.com/free-photo/young-beautiful-woman-pink-warm-sweater-natural-look-smiling-portrait-isolated-long-hair_285396-896.jpg?semt=ais_hybrid&w=740&q=80"));
  }

  Widget textWidget(){
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "/SignUpScreen");
      },
      child: Text("Splash"),
    );
  }
}
