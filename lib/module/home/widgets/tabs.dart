import 'package:first_project/module/home/controller.dart';
import 'package:first_project/module/home/widgets/notes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeTabs extends StatefulWidget {
  const HomeTabs({
    required this.controller,
    super.key,
  });

  final HomeController controller;

  @override
  State<HomeTabs> createState() => _HomeTabsState();
}

class _HomeTabsState extends State<HomeTabs>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {});
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey.shade200,
          ),
          height: 60,
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: TabBar(
            controller: tabController,
            tabs: [
              Tab(
                text: "tab1".tr,
              ),
              Tab(
                text: "tab2".tr,
              ),
              Tab(
                text: "tab3".tr,
              ),
            ],
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.black,
            ),
            labelColor: Colors.white,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w500,
              overflow: TextOverflow.ellipsis,
              fontSize: 14,
            ),
            unselectedLabelStyle: const TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: 14,
            ),
            unselectedLabelColor: Colors.grey,
            indicatorSize: TabBarIndicatorSize.tab,
            dividerColor: Colors.transparent,
            labelPadding: const EdgeInsets.all(0),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: [
              NotesList(title: "list_notes".tr,
                controller: widget.controller,
              ),
              NotesList(title: "highlight_notes".tr,
                controller: widget.controller,
              ),
              NotesList(title: "favourite_notes".tr,
                controller: widget.controller,
              ),
            ],
          ),
        )
      ],
    );
  }
}
