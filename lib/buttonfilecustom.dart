import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constnt/color.dart';

class ButtonFileCustom extends StatelessWidget {
  final Function() onTap;
  final String text;
  const ButtonFileCustom({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 25.h),
        width: Get.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0.r),
          gradient: const LinearGradient(colors: kFillColor),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF66C81C).withOpacity(0.53),
              offset: const Offset(0, 5.0),
              blurRadius: 30.0,
            ),
          ],
        ),
        child: Text(
          text,
          style: GoogleFonts.openSans(
            fontSize: 17.0.sp,
            color: const Color(0xFFFCFCFC),
            fontWeight: FontWeight.w600,
            height: 0.65.h,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
