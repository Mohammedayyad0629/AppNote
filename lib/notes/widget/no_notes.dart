import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constnt/color.dart';

class NoNotes extends StatelessWidget {
  const NoNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/images/Group 12.svg'),
          SizedBox(
            height: 60.h,
          ),
          Text(
            'No Notes :(',
            style: GoogleFonts.openSans(
              fontSize: 22.0.sp,
              color: kCorsserColor,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            'You have no task to do.',
            style: GoogleFonts.openSans(
              fontSize: 17.0.sp,
              color: const Color(0xFF82A0B7),
              height: 1.41.h,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
