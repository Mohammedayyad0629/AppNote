import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:notesapp/constnt/imges.dart';
import '../../constnt/color.dart';
import '../../notes/notes_controller.dart';
import '../homecontroller.dart';

class AbbBarHome extends GetView<HomeController> {
  const AbbBarHome({
    super.key,
    this.onTap,
    this.focusNode,
  });

  final void Function()? onTap;
  final FocusNode? focusNode;
  @override
  Widget build(BuildContext context) {
    NotesController notesController = Get.put(NotesController());
    return GetBuilder<HomeController>(
      builder: (controller) => Container(
        width: double.infinity,
        height: controller.notes.isNotEmpty ? 200.h : 100.h,
        decoration:
            const BoxDecoration(gradient: LinearGradient(colors: kFillColor)),
        child: Stack(
          children: [
            Positioned(
              left: -120.w,
              top: -50.h,
              child: SvgPicture.asset(
                'assets/images/Ellipse 11.svg',
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              child: SvgPicture.asset(
                'assets/images/Ellipse 12.svg',
              ),
            ),
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: 40.0.h, left: 30.w, right: 30.w, bottom: 10.h),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            FocusScope.of(context).requestFocus(FocusNode());
                          },
                          child: Container(
                            height: 50.h,
                            padding: EdgeInsets.symmetric(vertical: 8.0.w),
                            child: TextField(
                              controller: controller.textSearch,
                              onChanged: (value) {
                                notesController.searchNotes(value);
                              },
                              focusNode: focusNode,
                              style: GoogleFonts.openSans(
                                fontSize: 14.0,
                                color: kTextColor,
                                fontWeight: FontWeight.w700,
                              ),
                              cursorColor: kCorsserColor,
                              decoration: InputDecoration(
                                filled: true,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 0.h, horizontal: 10.w),
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                suffixIcon: InkWell(
                                  onTap: () {
                                    notesController.searchNotes(
                                        controller.textSearch.text);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0.r),
                                    child: SvgPicture.string(
                                      // Group 255
                                      '<svg viewBox="226.0 89.0 13.6 15.29" ><path transform="translate(226.0, 89.0)" d="M 10.71248149871826 1.837974190711975 C 9.527247428894043 0.652739942073822 7.951404094696045 -6.645917892456055e-06 6.275230884552002 -6.645917892456055e-06 C 4.599058151245117 -6.645917892456055e-06 3.023215293884277 0.6527643799781799 1.83798086643219 1.837974190711975 C 0.6527467370033264 3.023184061050415 -1.644053426730352e-08 4.599050998687744 -1.644053426730352e-08 6.275224208831787 C -1.644053426730352e-08 7.951396942138672 0.6527466177940369 9.527240753173828 1.83798086643219 10.71247291564941 C 3.023190498352051 11.89770984649658 4.599058151245117 12.55045700073242 6.275230884552002 12.55045700073242 C 7.951404094696045 12.55045700073242 9.527247428894043 11.89770984649658 10.71248054504395 10.71247291564941 C 11.89771556854248 9.527240753173828 12.550461769104 7.951396942138672 12.550461769104 6.275224208831787 C 12.550461769104 4.599050998687744 11.89771556854248 3.023183584213257 10.71248149871826 1.837974190711975 Z M 6.275230884552002 11.5365161895752 C 3.374162197113037 11.5365161895752 1.013940095901489 9.17629337310791 1.013940095901489 6.275224208831787 C 1.013940095901489 3.374155521392822 3.374162197113037 1.013933420181274 6.275230884552002 1.013933420181274 C 9.176299095153809 1.013933420181274 11.53652191162109 3.374155521392822 11.53652191162109 6.275224208831787 C 11.53652191162109 9.17629337310791 9.176299095153809 11.5365161895752 6.275230884552002 11.5365161895752 Z" fill="#b5b5b5" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(236.11, 100.81)" d="M 0 0 L 3.486239433288574 3.486239433288574" fill="none" stroke="#b5b5b5" stroke-width="2" stroke-miterlimit="4" stroke-linecap="round" /></svg>',
                                    ),
                                  ),
                                ),
                                suffixIconConstraints: BoxConstraints(
                                    minWidth: 20.w, minHeight: 0.h),
                                fillColor: kBackgroundColorLight,
                                hintText: 'Search Your Notes',
                                hintStyle: TextStyle(
                                  fontSize: 10.0.sp,
                                  color: const Color(0xFFB5B5B5),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 40.w,
                      ),
                      controller.userImage == ''
                          ? CircleAvatar(
                              radius: 20.0.r,
                              backgroundImage: AssetImage(
                                'assets/images/user.png',
                              ))
                          : CircleAvatar(
                              radius: 20.0.r,
                              backgroundImage:
                                  FileImage(File(controller.userImage.string)),
                            ),
                    ],
                  ),
                ),
                controller.userImage == ''
                    ? Positioned(
                        right: 25.w,
                        top: 40.h,
                        child: InkWell(
                          onTap: () {
                            controller.pickImage();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.add,
                              color: Colors.black,
                              size: 18,
                            ),
                          ),
                        ),
                      )
                    : Container()
              ],
            ),
            controller.notes.isNotEmpty
                ? Container(
                    margin: EdgeInsets.only(
                        top: 100.h, bottom: 10.h, left: 30.w, right: 30.w),
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.white.withOpacity(0.31),
                    ),
                    child: PageView.builder(
                        itemCount: controller.notes.length,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 100,
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      controller.notes[index].colorType ==
                                              kWorkColor.value
                                          ? 'Work'
                                          : controller.notes[index].colorType ==
                                                  kMeetingColor.value
                                              ? 'Meeting'
                                              : controller.notes[index]
                                                          .colorType ==
                                                      kShoppingColor.value
                                                  ? 'Shopping'
                                                  : 'Personal',
                                      style: GoogleFonts.openSans(
                                        fontSize: 20.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Text(
                                      controller.notes[index].body
                                          .split(' ')
                                          .take(4)
                                          .join(' '),
                                      maxLines: 1,
                                      style: GoogleFonts.openSans(
                                        fontSize: 11.0,
                                        color: const Color(0xFFF3F3F3),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Text(
                                      '${DateFormat('HH:mm').format(DateFormat('yyyy-MM-dd HH:mm:ss').parse(controller.notes[index].date)).toString()} PM, ${DateFormat('DD').format(DateFormat('yyyy-mm-dd').parse(controller.notes[index].date)).toString()} ${DateFormat('MMM').format(DateFormat('yyyy-mm-dd').parse(controller.notes[index].date)).toString().capitalizeFirst}',
                                      style: GoogleFonts.openSans(
                                        fontSize: 11.0,
                                        color: const Color(0xFFF3F3F3),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  padding: EdgeInsets.all(20.r),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: kCorsserColor,
                                  ),
                                  child: SvgPicture.asset(
                                    controller.notes[index].colorType ==
                                            kWorkColor.value
                                        ? kWorkimges
                                        : controller.notes[index].colorType ==
                                                kMeetingColor.value
                                            ? kMeetingimges
                                            : controller.notes[index]
                                                        .colorType ==
                                                    kShoppingColor.value
                                                ? kSohppingimges
                                                : kPersonalimges,
                                    width: 30.w,
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
