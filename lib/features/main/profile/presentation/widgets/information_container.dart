import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/resources/Color_Manager.dart';
import 'package:movies_app/core/resources/constanst_manager.dart';
import 'package:movies_app/core/widgets/custom_elevated_button.dart';
import 'package:movies_app/features/Auth/data/data_source/Local/auth_local_impl_data_source.dart';
import 'package:movies_app/features/main/profile/domain/Entities/User_Entity.dart';

class information_container extends StatelessWidget {
  information_container({super.key, required this.userProfileEntity});
  final AuthLocalImplDataSource authLocalImplDataSource =
      AuthLocalImplDataSource();
  UserProfileEntity userProfileEntity;

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
                        ConstanstManager.avatarimages[userProfileEntity
                            .avaterId!],
                        width: 118.w,
                        height: 118.h,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        userProfileEntity.name!,
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
                        '12',
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
                      onPressed: () {},
                      backgroundColor: ColorsManager.red,
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
