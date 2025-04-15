import 'package:first_project/module/home/controller.dart';
import 'package:first_project/module/home/widgets/tabs.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              "home_heading".tr,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                padding: const EdgeInsets.all(2),
                onPressed: () {},
                icon: const FaIcon(
                  FontAwesomeIcons.magnifyingGlass,
                  size: 20,
                ),
              ),
              IconButton(
                padding: const EdgeInsets.all(2),
                onPressed: () {},
                icon: const FaIcon(
                  FontAwesomeIcons.inbox,
                  size: 20,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
            ],
          ),
          body: Column(
            children: [
              Divider(
                color: Colors.grey.shade200,
                thickness: 2,
              ),
              Expanded(
                child: HomeTabs(controller: controller),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.toNamed('/addNotes');
            },
            backgroundColor: Colors.black,
            shape: const CircleBorder(),
            child: const Icon(Icons.add,color: Colors.white,),
          ),
        );
      });
  }
}
