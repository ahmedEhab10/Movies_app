import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/resources/Color_Manager.dart';
import 'package:movies_app/core/routes_manager/app_routes.dart';
import 'package:movies_app/core/widgets/custom_elevated_button.dart';
import 'package:movies_app/core/widgets/custom_text_faild.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            Spacer(flex: 1),
            Image.asset('assets/image/app_logo.png', height: 300.h),

            CustomTextFaild(hintText: 'Email', icon: Icons.email),
            SizedBox(height: 20.h),
            CustomTextFaild(
              hintText: 'Password',
              icon: Icons.lock,
              suffixicon: Icons.remove_red_eye,
            ),
            SizedBox(height: 8.h),
            Text(
              'Forget Password?',
              style: TextStyle(color: ColorsManager.primaryyellow),
              textAlign: TextAlign.end,
            ),
            SizedBox(height: 40.h),
            CustomElevatedButton(
              text: 'Login',
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.main_layout);
              },
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account?',
                  style: GoogleFonts.roboto(
                    fontSize: 16.sp,
                    color: ColorsManager.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(width: 5.w),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.Register_screen);
                  },
                  child: Text(
                    'Create One',
                    style: GoogleFonts.roboto(
                      fontSize: 16.sp,
                      color: ColorsManager.primaryyellow,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    color: ColorsManager.primaryyellow,
                    endIndent: 10.w,
                    indent: 100.w,
                  ),
                ),
                Text(
                  'or',
                  style: GoogleFonts.roboto(
                    fontSize: 16.sp,
                    color: ColorsManager.primaryyellow,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: ColorsManager.primaryyellow,
                    indent: 10.w,
                    endIndent: 100.w,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            CustomElevatedButton(
              text: 'Login With Google',
              onPressed: () {},
              assetName: 'assets/svg/googleicon.svg',
            ),
            Spacer(flex: 9),
          ],
        ),
      ),
    );
  }
}
