import 'package:flutter/material.dart';
import 'core/routing/app_routing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping App',
      theme: ThemeData(
        fontFamily: "Raleway"
      ),
      navigatorKey: RouteGenerator.navigatorKey,
      initialRoute: RouteGenerator.kSplash,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

