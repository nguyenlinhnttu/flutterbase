import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_base_source/features/home_view.dart';

import 'features/change_pass_view.dart';
import 'features/forgot_pass_view.dart';
import 'features/sign_in_view.dart';
import 'features/sign_up_view.dart';
import 'features/splash_view.dart';

class RoutePaths {
  static const String Splash = "Splash";
  static const String SignIn = "SignIn";
  static const String SignUp = "SignUp";
  static const String ForgotPass = "ForgotPass";
  static const String ChangePass = "ChangePass";
  static const String Home = "Home";
  static const String Profile = "Profile";
}

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.Splash:
        return MaterialPageRoute(builder: (_) => SplashView());
      case RoutePaths.SignIn:
        return MaterialPageRoute(builder: (_) => SignInView());
      case RoutePaths.SignUp:
        return CupertinoPageRoute(builder: (_) => SignUpView());
      case RoutePaths.Home:
        return MaterialPageRoute(
            settings: RouteSettings(name: RoutePaths.Home),
            builder: (context) => HomeView());
      case RoutePaths.ForgotPass:
        return CupertinoPageRoute(builder: (_) => ForgotPassView());
      case RoutePaths.ChangePass:
        return CupertinoPageRoute(builder: (_) => ChangePassView());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
