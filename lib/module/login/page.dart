import 'package:first_project/module/login/controller.dart';
import 'package:first_project/ui_kit/button/index.dart';
import 'package:first_project/ui_kit/button/type.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override


  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Text(
                          'login_heading'.tr,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'login_subHeading'.tr,
                          style: const TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 631,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        )),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: TabBar(
                              controller: controller.tabController,
                              tabs: [
                                Tab(
                                  text: "login".tr,
                                ),
                                Tab(
                                  text: "register".tr,
                                ),
                              ],
                              indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              labelColor: Colors.black,
                              labelStyle: const TextStyle(
                                fontWeight: FontWeight.w500,
                                overflow: TextOverflow.ellipsis,
                                fontSize: 14,
                              ),
                              unselectedLabelStyle: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 14,
                              ),
                              unselectedLabelColor: Colors.grey.shade700,
                              indicatorSize: TabBarIndicatorSize.tab,
                              dividerColor: Colors.transparent,
                              labelPadding: const EdgeInsets.all(0),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextField(
                            decoration: InputDecoration(
                                prefixIcon:
                                    const Icon(Icons.mail_outline_rounded),
                                labelText: "login_email".tr,
                                labelStyle: const TextStyle(color: Colors.grey),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade300),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade300),
                                  borderRadius: BorderRadius.circular(8.0),
                                )),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.lock_outline),
                                suffixIcon:
                                    const Icon(Icons.remove_red_eye_sharp),
                                labelText: "password".tr,
                                labelStyle: const TextStyle(color: Colors.grey),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade300),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade300),
                                  borderRadius: BorderRadius.circular(8.0),
                                )),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Checkbox(
                                value: controller.val,
                                onChanged: controller.onRememberMeChanged,
                                tristate: true,
                              ),
                              Expanded(child: Text("remember_me".tr)),
                              Text("forgot_password".tr),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          LNButton(
                            text: 'login'.tr,
                            onTap: () {
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              const Expanded(
                                  child: Divider(
                                endIndent: 10,
                              )),
                              Text("or_login_with".tr),
                              const Expanded(
                                  child: Divider(
                                indent: 10,
                              )),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: LNButton(
                                  text: "google".tr,
                                  iconData: Icons.g_mobiledata_sharp,
                                  type: ButtonType.outline,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: LNButton(
                                  onTap: () {
                                    print("Hello");
                                  },
                                  text: "facebook".tr,
                                  iconData: Icons.facebook_outlined,
                                  type: ButtonType.outline,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
