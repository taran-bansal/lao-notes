import 'dart:async';

import 'package:get/get.dart';

class SplashController extends GetxController{

  @override
  void onInit() {
    Timer(const Duration(seconds: 2), () {
      Get.toNamed('/home');
    });
    super.onInit();
  }
}