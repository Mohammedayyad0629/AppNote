import 'package:get/get.dart';

import '../medilewere/services.dart';

class FirstScreenController extends GetxController {
  MyServices myServices = Get.find();
  goto() {
    myServices.sharedPreferences.setString("step", "1");
    Get.toNamed('/home');
  }
}
