import 'package:flutter/material.dart';

class HeadingTile extends StatelessWidget {
  const HeadingTile({
    required this.title,
    super.key
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
            ),
            padding: const EdgeInsets.all(15),
            child: Text(
              title,
              style: const TextStyle(color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}
