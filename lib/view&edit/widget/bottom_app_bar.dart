import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../constnt/color.dart';
import '../../constnt/imges.dart';
import '../view_edit_controller.dart';

class BottomAppBarEdite extends GetView<ViewEditNoteController> {
  const BottomAppBarEdite({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0,
      color: Colors.transparent,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 8.w),
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        height: 60.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(38.0),
          color: kBackgroundColorLight,
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF888888).withOpacity(0.09),
              offset: const Offset(0, -6.0),
              blurRadius: 12.0,
            ),
          ],
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          InkWell(
            onTap: () {
              controller.pickImage(ImageSource.gallery);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(kImageimges),
                SizedBox(
                  height: 3.h,
                ),
                Text(
                  'To-do',
                  style: GoogleFonts.openSans(
                    fontSize: 8.0.sp,
                    color: const Color(0xFF9F9F9F),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              controller.pickImage(ImageSource.camera);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(kPhotoimges),
                SizedBox(
                  height: 3.h,
                ),
                Text(
                  'To-do',
                  style: GoogleFonts.openSans(
                    fontSize: 8.0.sp,
                    color: const Color(0xFF9F9F9F),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
