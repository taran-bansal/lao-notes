import 'package:get/get.dart';

class SettingController extends GetxController {
  bool isThemeDark = true;
  bool isDownloadViaWifi = true;
  bool isPlayInBackground = true;

  void onThemeChanged(bool val) {
    isThemeDark = val;
    update();
  }

  void onDownloadViaWifi(bool val) {
    isDownloadViaWifi = val;
    update();
  }

  void onPlayInBackground(bool val) {
    isPlayInBackground = val;
    update();
  }
}