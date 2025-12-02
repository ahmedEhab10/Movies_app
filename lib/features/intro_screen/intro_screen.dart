import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/resources/Color_Manager.dart';
import 'package:movies_app/core/widgets/custom_elevated_button.dart';

class Intro_Screen extends StatelessWidget {
  const Intro_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/image/intro_screen_photo.png'),
          Image.asset('assets/image/intro_photo.png'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                Spacer(flex: 9),
                Text(
                  'Find Your Next \n Favorite Movie Here',
                  style: GoogleFonts.inter(
                    color: ColorsManager.white,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  'Get access to a huge library of movies to suit all tastes. You will surely like it.',
                  style: GoogleFonts.inter(
                    color: ColorsManager.white.withAlpha(150),
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30.h),
                CustomElevatedButton(onPressed: () {}, text: 'Explore Now'),
                Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
