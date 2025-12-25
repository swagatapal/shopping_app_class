import 'package:flutter/material.dart';
import 'package:shopping_app/feature/splash_module/ui/splash_screen.dart';
import 'package:shopping_app/feature/splash_module/ui/start_screen.dart';
import '../../feature/authentication_module/ui/sign_up_screen.dart';
import '../constants/app_colors.dart';
import '../constants/app_font_size.dart';


class RouteGenerator {
  static const kSplash = "/";
  static const kStartScreen = "/StartScreen";

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case kSplash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case kStartScreen:
        return MaterialPageRoute(builder: (_) => const StartScreen());

      default:
        return _errorRoute(errorMessage: "Route not found: ${settings.name}");
    }
  }

  static Route<dynamic> _errorRoute({String errorMessage = ''}) {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Error", style: TextStyle(color: AppColors.colorBlack)),
          ),
          body: Center(
            child: Column(
              children: [
                Text(
                  "Oops something went wrong",
                  style: TextStyle(
                    fontSize: AppFontSize.textExtraLarge,
                    color: AppColors.colorBlack,
                  ),
                ),
                Text(
                  errorMessage,
                  style: TextStyle(
                    fontSize: AppFontSize.textExtraLarge,
                    color: AppColors.colorBlack,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
