import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class AddType extends StatelessWidget {
  const AddType(
      {super.key,
      required this.assetName,
      required this.typeNote,
      required this.countNote,
      required this.color});
  final String assetName;
  final String typeNote;
  final String countNote;

  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.offNamed('/addNote', arguments: {'color': color.value});
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0.r),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFBBBBBB).withOpacity(0.35),
              offset: const Offset(0, 7.0),
              blurRadius: 11.0,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                    padding: EdgeInsets.all(20.r),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: color.withOpacity(0.09),
                    ),
                    child: SvgPicture.asset(assetName)),
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Icon(
                    Iconsax.add,
                    size: 73.r,
                    color: color.withOpacity(0.9),
                  ),
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Icon(
                    Iconsax.add,
                    size: 70.r,
                    color: Colors.white.withOpacity(0.8),
                  ),
                )
              ],
            ),
            Text(
              typeNote,
              style: GoogleFonts.openSans(
                fontSize: 17.0.sp,
                color: const Color(0xFF686868),
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
