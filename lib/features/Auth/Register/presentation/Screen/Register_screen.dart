import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/resources/Color_Manager.dart';
import 'package:movies_app/core/resources/constanst_manager.dart';
import 'package:movies_app/core/widgets/custom_elevated_button.dart';
import 'package:movies_app/core/widgets/custom_text_faild.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            CarouselSlider(
              items: ConstanstManager.avatarimages
                  .map(
                    (item) => Container(
                      width: 158,
                      height: 158,
                      child: Center(
                        child: Image.asset(
                          item,
                          fit: BoxFit.cover,
                          width: 300.w,
                        ),
                      ),
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                animateToClosest: true,
                viewportFraction: 0.5,
                autoPlay: false,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  log(index.toString());
                },
              ),
            ),
            SizedBox(height: 20.h),

            CustomTextFaild(hintText: 'Name', icon: Icons.person),
            SizedBox(height: 10.h),
            CustomTextFaild(hintText: 'Email', icon: Icons.email),
            SizedBox(height: 10.h),
            CustomTextFaild(
              hintText: 'Password',
              icon: Icons.lock,
              suffixicon: Icons.remove_red_eye,
            ),
            SizedBox(height: 10.h),
            CustomTextFaild(
              hintText: 'Confirm Password',
              icon: Icons.lock,
              suffixicon: Icons.remove_red_eye,
            ),
            SizedBox(height: 10.h),
            CustomTextFaild(hintText: 'Phone', icon: Icons.phone),
            SizedBox(height: 8.h),

            SizedBox(height: 40.h),
            CustomElevatedButton(text: 'Create Account', onPressed: () {}),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account? ',
                  style: GoogleFonts.inter(
                    color: ColorsManager.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Login',
                    style: GoogleFonts.inter(
                      color: ColorsManager.primaryyellow,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
