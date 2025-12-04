import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/Utils/Ui_utils.dart';
import 'package:movies_app/core/Utils/validator_utils.dart';
import 'package:movies_app/core/resources/Color_Manager.dart';
import 'package:movies_app/core/resources/constanst_manager.dart';
import 'package:movies_app/core/widgets/custom_elevated_button.dart';
import 'package:movies_app/core/widgets/custom_text_faild.dart';
import 'package:movies_app/features/Auth/Register/presentation/cubit/cubit/register_cubit.dart';
import 'package:movies_app/features/Auth/data/Models/Register_request.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmpasswordController;
  late TextEditingController phoneController;

  int selectedImage = 0;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmpasswordController = TextEditingController();
    phoneController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmpasswordController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 50),
          child: Form(
            key: _formKey,
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
                      setState(() {
                        selectedImage = index;
                      });
                      log(selectedImage.toString());
                    },
                  ),
                ),

                SizedBox(height: 20.h),

                /// NAME
                CustomTextFaild(
                  hintText: 'Name',
                  icon: Icons.person,
                  controller: nameController,
                  validator: ValidatorUtils.validateName,
                ),

                SizedBox(height: 10.h),

                /// EMAIL
                CustomTextFaild(
                  hintText: 'Email',
                  icon: Icons.email,
                  controller: emailController,
                  validator: ValidatorUtils.validateEmail,
                ),

                SizedBox(height: 10.h),

                /// PASSWORD
                CustomTextFaild(
                  hintText: 'Password',
                  icon: Icons.lock,
                  suffixicon: Icons.remove_red_eye,
                  controller: passwordController,
                  validator: ValidatorUtils.validatePassword,
                ),

                SizedBox(height: 10.h),

                /// CONFIRM PASSWORD
                CustomTextFaild(
                  hintText: 'Confirm Password',
                  icon: Icons.lock,
                  suffixicon: Icons.remove_red_eye,
                  controller: confirmpasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return ' Please re-enter your password';
                    }
                    if (value != passwordController.text) {
                      return ' Passwords do not match';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 10.h),

                /// PHONE
                CustomTextFaild(
                  hintText: 'Phone',
                  icon: Icons.phone,
                  controller: phoneController,
                ),

                SizedBox(height: 40.h),

                /// BUTTON
                BlocListener<RegisterCubit, RegisterState>(
                  listener: (context, state) {
                    if (state is RegisterLoading) {
                      log('state is AuthLoading');
                      UIUtils.showLoading(context, isDismissible: false);
                    } else if (state is RegisterSuccess) {
                      log('state is AuthSuccess');
                      UIUtils.hideDialog(context);
                      UIUtils.showToastMessage(
                        "Successfully Registration",
                        Colors.green,
                      );
                      Navigator.pop(context);
                    } else if (state is RegisterError) {
                      UIUtils.hideDialog(context);
                      UIUtils.showToastMessage(state.message, Colors.red);
                    }
                  },
                  child: CustomElevatedButton(
                    text: 'Create Account',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        log('✅ All data valid');
                        BlocProvider.of<RegisterCubit>(context).register(
                          RegisterRequest(
                            name: nameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                            confirmPassword: confirmpasswordController.text,
                            phone: phoneController.text,
                            avaterId: selectedImage,
                          ),
                        );
                      }
                    },
                  ),
                ),

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
        ),
      ),
    );
  }
}
