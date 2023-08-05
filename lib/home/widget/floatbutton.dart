import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constnt/color.dart';
import '../../constnt/imges.dart';
import '../homecontroller.dart';
import 'add_type.dart';

class FloatButton extends GetView<HomeController> {
  const FloatButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => AnimatedOpacity(
        opacity: controller.isFabVisible.value ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 0),
        curve: Curves.easeInOut,
        child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            transform: Matrix4.translationValues(
              0.0,
              controller.isFabVisible.value ? 0.0 : 100.0,
              0.0,
            ),
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        padding: EdgeInsets.all(5.r),
                        child: Column(
                          children: [
                            Text(
                              'Choose the note type',
                              style: GoogleFonts.openSans(
                                fontSize: 22.0.sp,
                                color: kCorsserColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Expanded(
                              child: GridView(
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 16.w,
                                          mainAxisSpacing: 16.h),
                                  children: const [
                                    AddType(
                                      assetName: kPersonalimges,
                                      typeNote: 'Personal',
                                      countNote: '44',
                                      color: kPersonalColor,
                                    ),
                                    AddType(
                                      assetName: kWorkimges,
                                      typeNote: 'Work',
                                      countNote: '44',
                                      color: kWorkColor,
                                    ),
                                    AddType(
                                      assetName: kMeetingimges,
                                      typeNote: 'Meeting',
                                      countNote: '44',
                                      color: kMeetingColor,
                                    ),
                                    AddType(
                                      assetName: kSohppingimges,
                                      typeNote: 'Shopping',
                                      countNote: '44',
                                      color: kShoppingColor,
                                    ),
                                  ]),
                            ),
                          ],
                        ),
                      );
                    });
              },
              child:
                  // Group: Button
                  Container(
                      alignment: Alignment.center,
                      width: 53.0,
                      height: 53.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: const LinearGradient(
                          begin: Alignment(-0.54, -0.75),
                          end: Alignment(1.81, 2.01),
                          colors: kFloatColor,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF57B2F8).withOpacity(0.5),
                            offset: const Offset(0, 7.0),
                            blurRadius: 9.0,
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      )),
            ))));
  }
}
