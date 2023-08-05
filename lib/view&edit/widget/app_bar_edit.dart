import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../constnt/color.dart';

class AbbBarEdite extends StatelessWidget {
  const AbbBarEdite({super.key, this.onSave, this.isEdite, this.onChenge});
  final bool? isEdite;
  final void Function()? onChenge;
  final void Function()? onSave;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100.h,
      decoration:
          const BoxDecoration(gradient: LinearGradient(colors: kFillColor)),
      child: Stack(
        children: [
          Positioned(
            left: -120.w,
            top: -100.h,
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
          Padding(
            padding: EdgeInsets.only(
              top: 50.0.h,
              left: 30.w,
              right: 30.w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
                isEdite == false
                    ? IconButton(
                        onPressed: onChenge,
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      )
                    : IconButton(
                        onPressed: onSave,
                        icon: const Icon(
                          Icons.done,
                          color: Colors.white,
                        ),
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
