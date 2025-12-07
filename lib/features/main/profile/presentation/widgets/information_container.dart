import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/resources/Color_Manager.dart';
import 'package:movies_app/core/resources/constanst_manager.dart';
import 'package:movies_app/core/widgets/custom_elevated_button.dart';
import 'package:movies_app/features/Auth/Login/presentation/Screen/login_screen.dart';
import 'package:movies_app/features/Auth/data/data_source/Local/auth_local_impl_data_source.dart';
import 'package:movies_app/features/main/profile/domain/Entities/User_Entity.dart';

class information_container extends StatefulWidget {
  information_container({
    super.key,
    required this.userProfileEntity,
    required this.onNumberReceived,
  });
  UserProfileEntity userProfileEntity;
  final Function(int) onNumberReceived;

  @override
  State<information_container> createState() => _information_containerState();
}

class _information_containerState extends State<information_container> {
  int selectedIndex = 0;
  final AuthLocalImplDataSource authLocalImplDataSource =
      AuthLocalImplDataSource();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: ColorsManager.grey),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.43.h,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      Image.asset(
                        ConstanstManager.avatarimages[widget
                            .userProfileEntity
                            .avaterId!],
                        width: 118.w,
                        height: 118.h,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        widget.userProfileEntity.name!,
                        style: GoogleFonts.inter(
                          color: ColorsManager.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 20.w),
                  Column(
                    children: [
                      Text(
                        '0',
                        style: GoogleFonts.roboto(
                          color: ColorsManager.white,
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        'Wish List',
                        style: GoogleFonts.inter(
                          color: ColorsManager.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 20.w),
                  Column(
                    children: [
                      Text(
                        '10',
                        style: GoogleFonts.roboto(
                          color: ColorsManager.white,
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        'History',
                        style: GoogleFonts.inter(
                          color: ColorsManager.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: CustomElevatedButton(
                      text: 'Edit Profile',
                      onPressed: () async {
                        String token = await authLocalImplDataSource.getToken();
                        log(token);
                      },
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    flex: 1,
                    child: CustomElevatedButton(
                      textColor: ColorsManager.white,
                      text: 'Exit',
                      onPressed: () async {
                        await AuthLocalImplDataSource().deleteToken();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      backgroundColor: ColorsManager.red,
                    ),
                  ),
                ],
              ),
              Spacer(flex: 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = 0;
                      });

                      widget.onNumberReceived(selectedIndex);
                    },
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          'assets/svg/wiech_list.svg',
                          width: 30.w,
                          height: 30.h,
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          'Watch List',
                          style: GoogleFonts.inter(
                            color: ColorsManager.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = 1;
                      });

                      widget.onNumberReceived(selectedIndex);
                    },
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          'assets/svg/file_svg.svg',
                          width: 30.w,
                          height: 30.h,
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          'Histor',
                          style: GoogleFonts.inter(
                            color: ColorsManager.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Row(
                children: [
                  Expanded(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: 3.h,
                      decoration: BoxDecoration(
                        color: selectedIndex == 0
                            ? ColorsManager.primaryyellow
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 3.h,
                    decoration: BoxDecoration(
                      color: selectedIndex == 1
                          ? ColorsManager.primaryyellow
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
