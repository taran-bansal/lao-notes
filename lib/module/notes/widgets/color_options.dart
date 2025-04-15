import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

import '../../../ui_kit/icon/index.dart';
import '../controller.dart';

class ColorOptions extends StatelessWidget {
  const ColorOptions({
    this.onTap,
    this.svgPath,
    required this.isBackground,
    required this.controller,
    super.key,
  });

  final Function()? onTap;
  final NotesController controller;
  final String? svgPath;
  final bool isBackground;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: QuillToolbarColorButton(
          controller: controller.noteBodyController,
          isBackground: isBackground,
          child: (selectedColor, onTap) {
            return InkWell(
              onTap: onTap,
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: selectedColor ?? Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: LNIcon(
                    path: svgPath ?? "",
                    onTap: onTap,
                    color: selectedColor != null ? Colors.white : Colors.black,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
