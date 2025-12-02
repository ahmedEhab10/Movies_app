import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const Movie_App());
}

class Movie_App extends StatelessWidget {
  const Movie_App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(designSize: Size(430, 932), child: MaterialApp());
  }
}
