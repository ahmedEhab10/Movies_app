import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/Utils/Ui_utils.dart';
import 'package:movies_app/core/resources/Color_Manager.dart';
import 'package:movies_app/core/routes_manager/app_routes.dart';
import 'package:movies_app/core/widgets/custom_elevated_button.dart';
import 'package:movies_app/core/widgets/custom_text_faild.dart';
import 'package:movies_app/features/Auth/Login/presentation/cubit/cubit/login_cubit.dart';
import 'package:movies_app/features/Auth/data/Models/Login_request.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController, passwordController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

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

            CustomTextFaild(
              hintText: 'Email',
              icon: Icons.email,
              controller: emailController,
            ),
            SizedBox(height: 20.h),
            CustomTextFaild(
              controller: passwordController,
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
            BlocListener<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state is LoginLoading) {
                  log('state is AuthLoading');
                  UIUtils.showLoading(context, isDismissible: false);
                } else if (state is LoginSuccess) {
                  log('state is AuthSuccess');
                  UIUtils.hideDialog(context);
                  UIUtils.showToastMessage(
                    "Successfully Registration",
                    Colors.green,
                  );
                  // Navigator.pushNamed(context, AppRoutes.main_layout);
                } else if (state is LoginError) {
                  UIUtils.hideDialog(context);
                  UIUtils.showToastMessage(state.errormassage, Colors.red);
                }
              },
              child: CustomElevatedButton(
                text: 'Login',
                onPressed: () {
                  // BlocProvider.of<LoginCubit>(context).loginN(
                  //   loginRequest: Login_request(
                  //     email: emailController.text,
                  //     password: passwordController.text,
                  //   ),
                  // );

                  Navigator.pushNamed(context, AppRoutes.main_layout);
                },
              ),
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
