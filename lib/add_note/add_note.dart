import 'package:flutter/material.dart';
import 'package:flutter_focus_watcher/flutter_focus_watcher.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:notesapp/constnt/color.dart';
import 'package:notesapp/modles/note/note_modle.dart';
import '../constnt/imges.dart';
import '../view&edit/widget/app_bar_edit.dart';
import 'add_note_controller.dart';

class AddNote extends StatelessWidget {
  const AddNote({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddNoteController());

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: GetBuilder<AddNoteController>(
        builder: (controller) {
          return Scaffold(
            bottomNavigationBar: controller.myimage == null
                ? BottomAppBar(
                    elevation: 0,
                    color: Colors.transparent,
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 5.h, horizontal: 8.w),
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
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
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
                  )
                : null,
            body: Column(
              children: [
                AbbBarEdite(
                  onSave: () {
                    var noteModle = NoteModle(
                        body: controller.textNote.text,
                        date: DateTime.now().toString(),
                        colorType: controller.color,
                        imageUrl: controller.noteImge?.path);
                    controller.addNote(noteModle);
                  },
                ),
                Expanded(
                  child: FocusWatcher(
                      child: GestureDetector(
                    onTap: () {
                      if (!controller.focusNode.hasFocus) {
                        FocusScope.of(context)
                            .requestFocus(controller.focusNode);
                      } else {
                        controller.focusNode.unfocus();
                      }
                    },
                    child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 10.h, horizontal: 15.w),
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.3),
                              boxShadow: [
                                BoxShadow(
                                    color: Color(controller.color),
                                    blurRadius: 10,
                                    offset: Offset(0, 0))
                              ]),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 10.h, horizontal: 15.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 1,
                                  offset: Offset(0, 0))
                            ],
                          ),
                          child: ListView(
                            children: [
                              Obx(
                                () => TextField(
                                  focusNode: controller.focusNode,
                                  controller: controller.textNote,
                                  maxLines: controller.maxLines.value > 1
                                      ? controller.maxLines.value
                                      : null,
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                      hintText: 'Type Something....'),
                                ),
                              ),
                              controller.myimage != null
                                  ? Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 40.w),
                                      child: Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(15.r),
                                            child: Image.file(
                                              controller.myimage!,
                                            ),
                                          ),
                                          Positioned(
                                            right: 5,
                                            top: 5,
                                            child: InkWell(
                                              onTap: () {
                                                controller.myimage = null;
                                                controller.refresh();
                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 2.w,
                                                    vertical: 1.h),
                                                decoration: const BoxDecoration(
                                                  color: Colors.red,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: const Icon(
                                                  Icons.clear,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Container()
                            ],
                          ),
                        ),
                        Positioned(
                          right: 0,
                          child: Container(
                            width: 30.w,
                            height: 30.h,
                            margin: EdgeInsets.symmetric(
                                vertical: 10.h, horizontal: 15.w),
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border(
                                    left: BorderSide(
                                        color: Colors.black, width: 0.5),
                                    bottom: BorderSide(
                                        color: Colors.black, width: 0.5))),
                          ),
                        ),
                        Positioned(
                          right: 30.w,
                          top: 4.h,
                          child: Container(
                              width: 0.5.w,
                              height: 41.h,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                              ),
                              child: Transform.rotate(
                                angle: 135 *
                                    3.14 /
                                    180, // تحويل الدوران لتدوير الخط 45 درجة
                                child: Container(
                                  color: Colors.black,
                                ),
                              )),
                        ),
                        Positioned(
                          right: 30.w,
                          top: 20.h,
                          child: SvgPicture.asset(
                            kPinimges,
                            width: 25.w,
                          ),
                        )
                      ],
                    ),
                  )),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
