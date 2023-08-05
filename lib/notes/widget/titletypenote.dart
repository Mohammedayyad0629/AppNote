import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../notes_controller.dart';

class TitleTypeNote extends GetView<NotesController> {
  const TitleTypeNote({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotesController>(
      builder: (controller) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(
                  top: 20.h, left: 10.w, right: 10.w, bottom: 10.h),
              child: Text(
                controller.indexType == 0
                    ? 'All Note :'
                    : controller.indexType == 1
                        ? 'Personal :'
                        : controller.indexType == 2
                            ? 'Work :'
                            : controller.indexType == 3
                                ? 'Meeting :'
                                : 'Shopping :',
                style: GoogleFonts.openSans(
                  fontSize: 13.0,
                  color: const Color(0xFF8B87B3),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            controller.indexType != 0
                ? InkWell(
                    onTap: () {
                      controller.refresh();
                    },
                    child: Icon(Icons.filter_alt_off))
                : Container()
          ],
        ),
      ),
    );
  }
}
