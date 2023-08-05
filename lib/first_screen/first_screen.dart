import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../buttonfilecustom.dart';
import 'first_screen_controller.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FirstScreenController controller = Get.put(FirstScreenController());
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset(
              'assets/images/icon.png',
              width: 250.w,
            ),
            const Spacer(),
            Text(
              'Made it Simple',
              style: GoogleFonts.openSans(
                fontSize: 22.0.sp,
                color: const Color(0xFF554E8F),
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris pellentesque erat in blandit luctus.',
                style: GoogleFonts.openSans(
                  fontSize: 17.0.sp,
                  color: const Color(0xFF82A0B7),
                  height: 1.41.h,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: ButtonFileCustom(
                  onTap: () {
                    controller.goto();
                  },
                  text: 'Get Started'),
            ),
            SizedBox(
              height: 20.h,
            )
          ],
        ),
      ),
    );
  }
}
