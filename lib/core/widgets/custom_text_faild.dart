import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/resources/Color_Manager.dart';

class CustomTextFaild extends StatelessWidget {
  CustomTextFaild({
    super.key,
    required this.hintText,
    required this.icon,
    this.suffixicon,
    this.obscureText = false,
  });
  final String? hintText;
  final IconData? icon;
  final IconData? suffixicon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      style: GoogleFonts.roboto(
        color: ColorsManager.white,
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFF2C2C2C),
        hintText: hintText,
        hintStyle: GoogleFonts.roboto(
          color: ColorsManager.white,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),

        prefixIcon: Icon(icon, color: Colors.white),
        suffixIcon: suffixicon == null
            ? null
            : Icon(suffixicon, color: Colors.white),

        contentPadding: const EdgeInsets.symmetric(
          vertical: 18,
          horizontal: 15,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.white54, width: .8),
        ),
      ),
    );
  }
}
