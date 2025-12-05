import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/routes_manager/app_routes.dart';
import 'package:movies_app/features/Auth/Login/presentation/Screen/login_screen.dart';
import 'package:movies_app/features/Auth/Register/presentation/Screen/Register_screen.dart';
import 'package:movies_app/features/Splash/splash_screen.dart';
import 'package:movies_app/features/inboarding/in_boarding_screen.dart';
import 'package:movies_app/features/intro_screen/intro_screen.dart';
import 'package:movies_app/features/main/home/movieDetails.dart';
import 'package:movies_app/features/main/main_layout.dart';

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
      case AppRoutes.loin_screen:
        {
          return CupertinoPageRoute(builder: (context) => LoginScreen());
        }
      case AppRoutes.Register_screen:
        {
          return CupertinoPageRoute(builder: (context) => RegisterScreen());
        }
      case AppRoutes.onboarding_screen:
        {
          return CupertinoPageRoute(builder: (context) => OnBoardingScreen());
        }
      case AppRoutes.main_layout:
        {
          return CupertinoPageRoute(builder: (context) => MainLayout());
        }
      case AppRoutes.moviesDetails:
        {
          return CupertinoPageRoute(builder: (context) => Moviedetails());
        }
    }
  }
}
