import 'package:first_project/module/notes/widgets/color_options.dart';
import 'package:first_project/module/notes/widgets/text_format_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import '../../../common/constants/svg_paths.dart';
import '../controller.dart';

class NotesPagesTextFormat extends StatelessWidget {
  const NotesPagesTextFormat({
    required this.controller,
    super.key});

  final NotesController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(
            thickness: 1,
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ColorOptions(
                controller: controller,
                isBackground: false,
                svgPath: SvgPathsConstants.paintBoard,
              ),
              const SizedBox(width: 10),
              ColorOptions(
                controller: controller,
                isBackground: true,
                svgPath: SvgPathsConstants.paintBucket,
              )
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextFormatOptions(
                attribute: Attribute.bold,
                svgPath: SvgPathsConstants.bold,
                controller: controller,
              ),
              const SizedBox(width: 10),
              TextFormatOptions(
                attribute: Attribute.italic,
                svgPath: SvgPathsConstants.italic,
                controller: controller,
              ),
              const SizedBox(width: 10),
              TextFormatOptions(
                attribute: Attribute.underline,
                svgPath: SvgPathsConstants.underLine,
                controller: controller,
              ),
              const SizedBox(width: 10),
              TextFormatOptions(
                attribute: Attribute.strikeThrough,
                svgPath: SvgPathsConstants.strikeThrough,
                controller: controller,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            width: double.maxFinite,
            decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(10.0)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextFormatOptions(
                  attribute: Attribute.leftAlignment,
                  svgPath: SvgPathsConstants.textAlignLeft,
                  controller: controller,
                ),
                TextFormatOptions(
                  attribute: Attribute.centerAlignment,
                  svgPath: SvgPathsConstants.textAlignCenter,
                  controller: controller,
                ),
                TextFormatOptions(
                  attribute: Attribute.rightAlignment,
                  svgPath: SvgPathsConstants.textAlignRight,
                  controller: controller,
                ),
                TextFormatOptions(
                  attribute: Attribute.justifyAlignment,
                  svgPath: SvgPathsConstants.textAlignJustify,
                  controller: controller,
                ),
                TextFormatOptions(
                  attribute: Attribute.subscript,
                  svgPath: SvgPathsConstants.subScript,
                  controller: controller,
                ),
                TextFormatOptions(
                  attribute: Attribute.superscript,
                  svgPath: SvgPathsConstants.superScript,
                  controller: controller,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
