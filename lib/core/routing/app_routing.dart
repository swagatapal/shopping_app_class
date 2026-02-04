import 'package:flutter/material.dart';
import 'package:shopping_app/feature/authentication_module/ui/NewPasswordScreen.dart';
import 'package:shopping_app/feature/authentication_module/ui/Password_Recovery.dart';
import 'package:shopping_app/feature/authentication_module/ui/Password_Recovery_Code.dart';
import 'package:shopping_app/feature/authentication_module/ui/Password_Screen.dart';
import 'package:shopping_app/feature/authentication_module/ui/login_page.dart';
import 'package:shopping_app/feature/splash_module/ui/CategoriesFilter.dart';
import 'package:shopping_app/feature/splash_module/ui/Flash_Sale_Fullprofile.dart';
import 'package:shopping_app/feature/splash_module/ui/Hello_card.dart';
import 'package:shopping_app/feature/splash_module/ui/Profile.dart';
import 'package:shopping_app/feature/splash_module/ui/Shop.dart';
import 'package:shopping_app/feature/splash_module/ui/Story_Product_Style.dart';
import 'package:shopping_app/feature/splash_module/ui/live.dart';
import 'package:shopping_app/feature/splash_module/ui/start_screen.dart';
import '../../feature/authentication_module/ui/sign_up_screen.dart';
import '../constants/app_colors.dart';
import '../constants/app_font_size.dart';


class RouteGenerator {
  static const kSplash = "/";
  static const kSignUpScreen = "/SignUpScreen";
  static const kLoginPage = "/LoginPage";
  static const kPasswordScreen = "/PasswordScreen";
  static const kPasswordRecovery = "/PasswordRecovery";
  static const kHelloCard = "/HelloCard";
  static const kPasswordRecoveryCode = "/PasswordRecoveryCode";
  static const kNewPasswordScreen = "/NewPasswordScreen";
  static const kProfile = "/Profile";
  static const kShop = "/Shop";
  static const kFlashSaleFullprofile = "/FlashSaleFullprofile";
  static const kLive = "/Live";
  static const kStoryProductStyle = "/StoryProductStyle";
  static const kCategoriesFilter = "/CategoriesFilter";
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case kSplash:
        return MaterialPageRoute(builder: (_) => const StartScreen());
        case kSignUpScreen:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case kLoginPage:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case kPasswordScreen:
        return MaterialPageRoute(builder: (_) => const PasswordScreen());
      case kPasswordRecovery :
        return MaterialPageRoute(builder: (_) => const PasswordRecovery());
      case kHelloCard :
        return MaterialPageRoute(builder: (_) => const HelloCard());
      case kPasswordRecoveryCode :
        return MaterialPageRoute(builder: (_) => const PasswordRecoveryCode());
      case kNewPasswordScreen:
        return MaterialPageRoute(builder: (_) => const NewPasswordScreen());
      case kProfile:
        return MaterialPageRoute(builder: (_) => const Profile());
      case kShop:
        return MaterialPageRoute(builder: (_) => const Shop());
      case kFlashSaleFullprofile:
        return MaterialPageRoute(builder: (_) => const FlashSaleFullprofile());
      case kLive:
        return MaterialPageRoute(builder: (_) => const Live());
      case kStoryProductStyle:
        return MaterialPageRoute(builder: (_) => const StoryProductStyle());
      case kCategoriesFilter:
        return MaterialPageRoute(builder: (_) => const CategoriesFilter());









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
