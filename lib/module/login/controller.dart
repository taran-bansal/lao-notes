
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController with GetTickerProviderStateMixin {
  late TabController tabController;

  bool? val;

  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      print(tabController.index);
    });
    super.onInit();
  }

  void onRememberMeChanged(bool? newVal) {
    val = newVal;
    update();
  }
}
