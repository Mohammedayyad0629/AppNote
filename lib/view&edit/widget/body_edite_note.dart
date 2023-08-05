import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_focus_watcher/flutter_focus_watcher.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../constnt/imges.dart';
import '../view_edit_controller.dart';

class BodyEditeNote extends GetView<ViewEditNoteController> {
  const BodyEditeNote({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViewEditNoteController>(
      builder: (controller) => Expanded(
        child: FocusWatcher(
          child: GestureDetector(
            onTap: () {
              if (!controller.focusNode.hasFocus) {
                FocusScope.of(context).requestFocus(controller.focusNode);
              } else {
                controller.focusNode.unfocus();
              }
            },
            child: controller.isEdite == true
                ? Stack(
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
                                  offset: const Offset(0, 0))
                            ]),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 15.w),
                        decoration: const BoxDecoration(
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
                                enabled: controller.isEdite,
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
                            controller.imge != null
                                ? GetBuilder<ViewEditNoteController>(
                                    builder: (controller) => Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 40.w),
                                      child: Stack(
                                        children: [
                                          ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15.r),
                                              child: controller.imge != null
                                                  ? Image.file(
                                                      File(controller.imge!),
                                                    )
                                                  : Container()),
                                          controller.isEdite == true
                                              ? Positioned(
                                                  right: 5.w,
                                                  top: 5.h,
                                                  child: InkWell(
                                                    onTap: () {
                                                      controller.imge = null;
                                                      controller.refresh();
                                                    },
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 2.w,
                                                              vertical: 1.h),
                                                      decoration:
                                                          const BoxDecoration(
                                                        color: Colors.red,
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: const Icon(
                                                        Icons.clear,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              : Container()
                                        ],
                                      ),
                                    ),
                                  )
                                : controller.myimage != null
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
                                                  decoration:
                                                      const BoxDecoration(
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
                          decoration: const BoxDecoration(
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
                            decoration: const BoxDecoration(
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
                  )
                : ListView(
                    children: [
                      Obx(
                        () => TextField(
                          enabled: controller.isEdite,
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
                      controller.imge != null
                          ? GetBuilder<ViewEditNoteController>(
                              builder: (controller) => Container(
                                margin: EdgeInsets.symmetric(horizontal: 40.w),
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(15.r),
                                        child: controller.imge != null
                                            ? Image.file(
                                                File(controller.imge!),
                                              )
                                            : Container()),
                                    controller.isEdite == true
                                        ? Positioned(
                                            right: 5,
                                            top: 5,
                                            child: InkWell(
                                              onTap: () {
                                                controller.imge = null;
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
                                          )
                                        : Container()
                                  ],
                                ),
                              ),
                            )
                          : controller.myimage != null
                              ? Container(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 40.w),
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
                                                horizontal: 2.w, vertical: 1.h),
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
        ),
      ),
    );
  }
}
