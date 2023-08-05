import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constnt/color.dart';
import '../homecontroller.dart';

class BarBottom extends GetView<HomeController> {
  const BarBottom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: (index) => controller.currentIndex.value = index,
          selectedLabelStyle: const TextStyle(color: Colors.black),
          selectedItemColor: kCorsserColor,
          showUnselectedLabels: true,
          unselectedItemColor: Colors.grey,
          unselectedFontSize: 10,
          selectedFontSize: 12,
          items: [
            ...List.generate(
                controller.text.length,
                (index) => BottomNavigationBarItem(
                    icon: controller.icon[index],
                    activeIcon: controller.activeIcon[index],
                    label: controller.text[index])),
          ]),
    );
  }
}
