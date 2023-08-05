import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'homecontroller.dart';
import 'widget/app_bar.dart';
import 'widget/barbottom.dart';
import 'widget/floatbutton.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    controller.keyboardVisibilityController.onChange.listen((bool visible) {
      if (visible) {
        controller.toggleFabVisibility(false);
      } else {
        controller.setKeyboardClosed(true);
        controller.toggleFabVisibility(true);
      }
    });
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: GetBuilder<HomeController>(
          builder: (controller) => Scaffold(
            floatingActionButton: const FloatButton(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: const BarBottom(),
            body: Obx(() => Column(
                  children: [
                    AbbBarHome(
                      onTap: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                      },
                    ),
                    controller.pages[controller.currentIndex.value],
                  ],
                )),
          ),
        ));
  }
}
