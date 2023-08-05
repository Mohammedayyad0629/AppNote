import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class NoteType extends StatelessWidget {
  const NoteType(
      {super.key,
      required this.assetName,
      required this.typeNote,
      required this.countNote,
      required this.onTap,
      required this.color});
  final String assetName;
  final String typeNote;
  final String countNote;
  final Function() onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0.r),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFBBBBBB).withOpacity(0.35),
              offset: Offset(0, 7.0),
              blurRadius: 11.0,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                padding: EdgeInsets.all(20.r),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color.withOpacity(0.25),
                ),
                child: SvgPicture.asset(assetName)),
            Text(
              typeNote,
              style: GoogleFonts.openSans(
                fontSize: 17.0.sp,
                color: const Color(0xFF686868),
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            Text.rich(
              TextSpan(
                style: GoogleFonts.openSans(
                  fontSize: 12.0,
                  color: const Color(0xFFA1A1A1),
                ),
                children: [
                  TextSpan(
                    text: countNote,
                  ),
                  TextSpan(
                    text: ' \nNotes',
                    style: GoogleFonts.openSans(
                      fontSize: 8.0,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
