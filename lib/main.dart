import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/routes_manager/app_routes.dart';
import 'package:movies_app/core/routes_manager/routes_manager.dart';
import 'package:movies_app/core/theme/theme_manager.dart';

void main() {
  runApp(const Movie_App());
}

class Movie_App extends StatelessWidget {
  const Movie_App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      child: MaterialApp(
        theme: ThemeManager.dark,
        onGenerateRoute: RoutesManager.router,
        initialRoute: AppRoutes.splash,
      ),
    );
  }
}
