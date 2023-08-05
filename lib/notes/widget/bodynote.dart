import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import '../../constnt/color.dart';
import '../../home/homecontroller.dart';
import '../notes_controller.dart';

class BodyNote extends GetView<NotesController> {
  const BodyNote({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Expanded(
      child: GetBuilder<NotesController>(
        builder: (controller) => Obx(
          () => ListView.builder(
            itemCount: controller.notes.length,
            itemBuilder: (BuildContext context, int index) {
              final note = controller.notes[index];
              return InkWell(
                onTap: () {
                  Get.toNamed('/viewEditNote', arguments: {
                    'color': note.colorType,
                    'noteImge': note.imageUrl,
                    'bodyNote': note.body,
                    'date': note.date,
                    'index': index
                  });
                },
                child: Slidable(
                  key: const ValueKey(0),

                  // The start action pane is the one at the left or the top side.
                  startActionPane: ActionPane(
                    // A motion is a widget used to control how the pane animates.
                    motion: const ScrollMotion(),

                    // A pane can dismiss the Slidable.

                    // All actions are defined in the children parameter.
                    children: [
                      SlidableAction(
                        onPressed: (context) {},
                        backgroundColor: const Color(0xFF21B7CA),
                        foregroundColor: Colors.white,
                        icon: Icons.share,
                        label: 'Share',
                      ),
                    ],
                  ),

                  // The end action pane is the one at the right or the bottom side.
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) {
                          note.delete();
                          controller.refresh();
                        },
                        backgroundColor: const Color(0xFFFE4A49),
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Delete',
                      ),
                    ],
                  ),
                  child: Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0.r),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          offset: const Offset(0, 4.0),
                          blurRadius: 9.0,
                        ),
                      ],
                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 5.w,
                          height: 60.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(5.0.r),
                            ),
                            color: Color(note.colorType),
                            boxShadow: [
                              BoxShadow(
                                color:
                                    const Color(0xFF1ED102).withOpacity(0.24),
                                offset: const Offset(0, 3.0),
                                blurRadius: 6.0,
                              ),
                            ],
                          ),
                        ),
                        const Spacer(flex: 19),
                        SizedBox(
                          width: 30.w,
                          child: Text.rich(
                            TextSpan(
                              style: GoogleFonts.rubik(
                                fontSize: 15.0.sp,
                                color: const Color(0xFFC6C6C8),
                              ),
                              children: [
                                TextSpan(
                                  text: DateFormat('dd')
                                      .format(DateFormat('yyyy-mm-dd')
                                          .parse(note.date))
                                      .toString(),
                                ),
                                TextSpan(
                                  text:
                                      ' \n${DateFormat('MMM').format(DateFormat('yyyy-mm-dd').parse(controller.notes[index].date)).toString()}',
                                  style: GoogleFonts.rubik(
                                    fontSize: 11.0.sp,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      ' \n${DateFormat('HH:mm').format(DateFormat('yyyy-MM-dd HH:mm:ss').parse(controller.notes[index].date)).toString()}',
                                  style: GoogleFonts.rubik(
                                    fontSize: 11.0.sp,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const Spacer(flex: 19),
                        Align(
                          alignment: const Alignment(0.0, -0.06),
                          child: Text(
                            note.body.split(' ').take(5).join(' '),
                            maxLines: 1,
                            style: GoogleFonts.openSans(
                              fontSize: 14.0.sp,
                              color: kCorsserColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const Spacer(flex: 135),
                        note.isFavorite == false || note.isFavorite == null
                            ? InkWell(
                                onTap: () {
                                  note.isFavorite = true;
                                  note.save();
                                  homeController.refresh();
                                  controller.refresh();
                                },
                                child: Padding(
                                  padding: EdgeInsets.all(10.r),
                                  child: const Icon(Iconsax.heart),
                                ),
                              )
                            : InkWell(
                                onTap: () {
                                  note.isFavorite = false;
                                  note.save();
                                  homeController.refresh();

                                  controller.refresh();
                                },
                                child: Padding(
                                  padding: EdgeInsets.all(10.r),
                                  child: const Icon(
                                    Iconsax.heart5,
                                    color: Colors.red,
                                  ),
                                ),
                              )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
