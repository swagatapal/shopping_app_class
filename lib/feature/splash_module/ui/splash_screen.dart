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
      appBar: AppBar(),
      body: Column(
        children: [
          textWidget(),
        ],
      ),
    );
  }
  Widget textWidget(){
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "/StartScreen");
      },
      child: Center(
        child:  Text("Splash",style: TextStyle(color: Colors.black,fontSize: 40),),
      ),
    );
  }
}
