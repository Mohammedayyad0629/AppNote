import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesapp/medilewere/services.dart';

class MyMedileWere extends GetMiddleware {
  @override

  // ignore: overridden_fields
  int? priority = 1;

  MyServices myServices = Get.find();
  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString('step') == "1") {
      return const RouteSettings(name: '/home');
    }

    return null;
  }
}
