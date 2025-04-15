import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({required this.children, super.key});

  final List<Widget> children;

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int selectedNavigation = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedNavigation,
        children: widget.children,
      ),
      bottomNavigationBar: Container(
        height: 75,
        decoration: const BoxDecoration(color: Colors.black),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  selectedNavigation = 0;
                });
              },
              icon: FaIcon(
                FontAwesomeIcons.house,
                size: 20,
                color: selectedNavigation == 0 ? Colors.white : Colors.grey,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  selectedNavigation = 1;
                });
              },
              icon: FaIcon(
                FontAwesomeIcons.message,
                size: 20,
                color: selectedNavigation == 1 ? Colors.white : Colors.grey,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  selectedNavigation = 2;
                });
              },
              icon: FaIcon(
                FontAwesomeIcons.gear,
                size: 20,
                color: selectedNavigation == 2 ? Colors.white : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
