
import 'package:first_project/common/constants/svg_paths.dart';
import 'package:first_project/module/splashScreen/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../ui_kit/icon/index.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
        init: SplashController(),
        builder: (controller) {
          return const Scaffold(
            backgroundColor: Colors.black,
            body: SizedBox(
              width: double.maxFinite,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  LNIcon(
                    path: SvgPathsConstants.splashIcon,
                    color: Colors.white,
                    size: 100,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "LAO Notes",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )
                ],
              ),
            ),
          );
        });
  }
}
