import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:picby/main.dart';
import 'package:picby/screen/GoogleScreen.dart';
import 'package:picby/screen/HomeScreen.dart';
import 'package:picby/screen/LoginScreen.dart';
import 'package:picby/screen/RegisterScreen.dart';
import 'package:picby/screen/ResetPasswordScreen.dart';

const String initialRoute = '/';
const String homeRoute = '/home';
const String loginRoute = '/login';
const String googleRoute = '/google';
const String registerRoute = '/register';
const String resetPasswordRoute = '/reset';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initialRoute:
        return MaterialPageRoute(builder: (_) => App());
        break;
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomeScreen());
        break;
      case loginRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen());
        break;
      case googleRoute:
        return MaterialPageRoute(builder: (_) => GoogleScreen());
        break;
      case registerRoute:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
        break;
      case resetPasswordRoute:
        return MaterialPageRoute(builder: (_) => ResetPasswordScreen());
        break;
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
