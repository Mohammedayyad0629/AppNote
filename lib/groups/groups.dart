import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:notesapp/constnt/color.dart';

import '../constnt/imges.dart';
import '../home/homecontroller.dart';
import '../notes/notes_controller.dart';
import 'widget/note_type.dart';

class Groups extends StatelessWidget {
  const Groups({super.key});

  @override
  Widget build(BuildContext context) {
    NotesController notesController = Get.find<NotesController>();
    HomeController homeController = Get.find<HomeController>();
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(top: 80.h),
        margin: EdgeInsets.symmetric(
          horizontal: 10.w,
        ),
        child: GridView(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.w,
                mainAxisSpacing: 16.h),
            children: [
              NoteType(
                assetName: kPersonalimges,
                typeNote: 'Personal',
                countNote: '44',
                color: kPersonalColor,
                onTap: () {
                  notesController.personalFilteredNotes();
                  homeController.currentIndex.value = 0;
                },
              ),
              NoteType(
                assetName: kWorkimges,
                typeNote: 'Work',
                countNote: '44',
                color: kWorkColor,
                onTap: () {
                  notesController.workFilteredNotes();
                  homeController.currentIndex.value = 0;
                },
              ),
              NoteType(
                assetName: kMeetingimges,
                typeNote: 'Meeting',
                countNote: '44',
                color: kMeetingColor,
                onTap: () {
                  notesController.meetingFilteredNotes();
                  homeController.currentIndex.value = 0;
                },
              ),
              NoteType(
                assetName: kSohppingimges,
                typeNote: 'Shopping',
                countNote: '44',
                color: kShoppingColor,
                onTap: () {
                  notesController.shoppingFilteredNotes();
                  homeController.currentIndex.value = 0;
                },
              ),
            ]),
      ),
    );
  }
}
