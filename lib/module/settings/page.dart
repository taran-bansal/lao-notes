import 'package:first_project/module/settings/controller.dart';
import 'package:first_project/module/settings/widgets/heading_tile.dart';
import 'package:first_project/module/settings/widgets/settings_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(
      init: SettingController(),
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 50.0,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "name".tr,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "settings_email".tr,
                    style: const TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 160,
                    padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "edit_profile".tr,
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.white,
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  HeadingTile(title: "settings_content".tr),
                  SettingsTile(
                    leading: Icons.favorite,
                    title: "favourites".tr,
                    trailing: Icons.arrow_forward_ios_outlined,
                    showSwitch: false,
                  ),
                  SettingsTile(
                    leading: Icons.download_for_offline_outlined,
                    title: "downloads".tr,
                    trailing: Icons.arrow_forward_ios_outlined,
                    showSwitch: false,
                  ),
                  HeadingTile(title: "settings_preferences".tr),
                  SettingsTile(
                    leading: Icons.language_sharp,
                    title: "language".tr,
                    trailing: Icons.arrow_forward_ios_outlined,
                    showSwitch: false,
                    displayLanguage: "selected_language".tr,
                  ),
                  SettingsTile(
                    leading: Icons.dark_mode_outlined,
                    title: "dark_mode".tr,
                    showSwitch: true,
                    switchValue: controller.isThemeDark,
                    onSwitchValueChanged: controller.onThemeChanged,
                  ),
                  SettingsTile(
                    leading: Icons.wifi,
                    title: "only_download_via_wifi".tr,
                    showSwitch: true,
                    switchValue: controller.isDownloadViaWifi,
                    onSwitchValueChanged: controller.onDownloadViaWifi,
                  ),
                  SettingsTile(
                    leading: Icons.featured_play_list_outlined,
                    title: "play_in_background".tr,
                    showSwitch: true,
                    switchValue: controller.isPlayInBackground,
                    onSwitchValueChanged: controller.onPlayInBackground,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

}