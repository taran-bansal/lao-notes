import 'package:first_project/common/constants/svg_paths.dart';
import 'package:first_project/module/notes/controller.dart';
import 'package:first_project/module/notes/widgets/note_page_text_format.dart';
import 'package:first_project/ui_kit/icon/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotesController>(
        init: NotesController(),
        global: false,
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              leading: Center(
                child: LNIcon(
                  path: SvgPathsConstants.back,
                  size: 26,
                  onTap: () => controller.saveNote(),
                ),
              ),
              title: const Text(
                "Edited On - 08 Jan, 2025",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              actions: [
                LNIcon(
                  path: SvgPathsConstants.share,
                  onTap: () {},
                ),
                LNIcon(
                  path: SvgPathsConstants.delete,
                  onTap: () {},
                ),
              ],
            ),
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Column(
                children: [
                  // QuillSimpleToolbar(
                  //   controller: controller.noteBodyController,
                  //   configurations: QuillSimpleToolbarConfigurations(
                  //       multiRowsDisplay: true,
                  //       customButtons: [
                  //         QuillToolbarCustomButtonOptions(
                  //           icon: Icon(Icons.add),
                  //         )
                  //       ]),
                  // ),
                  TextFormField(
                    // onChanged: controller.onTextChanged,
                    cursorColor: Colors.black,
                    controller: controller.titleController,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                    minLines: 1,
                    maxLines: 5,
                    maxLength: 250,
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 16),
                      counterText: '',
                      enabledBorder:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                      focusedBorder:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: 'notes_title'.tr,
                      hintStyle: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Expanded(
                    child: QuillEditor.basic(
                      controller: controller.noteBodyController,
                      configurations: QuillEditorConfigurations(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        placeholder: 'notes_subtitle'.tr,
                      ),
                    ),
                  ),
                  if(controller.doShowTextFormatOptions) ...{
                    NotesPagesTextFormat(controller: controller),
                  },
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      // borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LNIcon(
                          onTap: () {
                            controller.onTapQuickActions();
                          },
                          path: SvgPathsConstants.addSquare,
                        ),
                        Row(
                          children: [
                            LNIcon(
                              path: SvgPathsConstants.undo,
                              onTap: () {
                                controller.onTapUndo();
                              },
                            ),
                            LNIcon(
                              path: SvgPathsConstants.redo,
                              onTap: () {
                                controller.onTapRedo();
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
