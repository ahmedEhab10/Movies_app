import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/routes_manager/app_routes.dart';
import 'package:movies_app/features/Splash/splash_screen.dart';
import 'package:movies_app/features/intro_screen/intro_screen.dart';

class RoutesManager {
  static Route? router(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        {
          return CupertinoPageRoute(builder: (context) => SplashScreen());
        }
      case AppRoutes.intro_screen:
        {
          return CupertinoPageRoute(builder: (context) => Intro_Screen());
        }
    }
  }
}
