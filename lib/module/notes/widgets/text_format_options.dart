import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill/translations.dart';

import '../../../ui_kit/icon/index.dart';
import '../controller.dart';

class TextFormatOptions extends StatelessWidget {
  const TextFormatOptions({
    this.onTap,
    this.svgPath,
    this.child,
    required this.attribute,
    required this.controller,
    super.key,
  });

  final String? svgPath;
  final Function()? onTap;
  final Widget? child;
  final Attribute attribute;
  final NotesController controller;


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: FlutterQuillLocalizationsWidget(
          child: QuillToolbarToggleStyleButton(
            controller: controller.noteBodyController,
            attribute: attribute,
            child: (isSelected, onTap) => InkWell(
              onTap: onTap,
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: isSelected ? Colors.grey.shade300: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: child ?? Center(
                  child: LNIcon(
                    path: svgPath ?? "",
                    onTap: onTap,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}