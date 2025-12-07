import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/resources/Color_Manager.dart';

class GenraItem extends StatelessWidget {
  const GenraItem({
    super.key,
    this.isSelected = false,
    required this.title,
    required this.onTap,
  });
  final bool isSelected;
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? ColorsManager.primaryyellow : Colors.transparent,
          border: Border.all(color: ColorsManager.primaryyellow, width: 2.w),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
          child: Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 20.sp,

              fontWeight: FontWeight.bold,
              color: isSelected
                  ? ColorsManager.primaryblack
                  : ColorsManager.primaryyellow,
            ),
          ),
        ),
      ),
    );
  }
}
