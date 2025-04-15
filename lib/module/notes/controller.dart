import 'dart:async';
import 'dart:convert';

import 'package:first_project/common/constants/svg_paths.dart';
import 'package:first_project/common/models/widgets/notes_page_bottom_sheet_model.dart';
import 'package:first_project/module/home/controller.dart';
import 'package:first_project/module/notes/widgets/notes_page_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';

import '../../common/models/widgets/db_notes_model.dart';
import '../../common/services/db.dart';

class NotesController extends GetxController {
  QuillController noteBodyController = QuillController.basic();
  TextEditingController titleController = TextEditingController();
  final DatabaseService db = DatabaseService();
  late DbNotesModel note; // Store the current note


  late List<NotesPageBottomSheetModel> moreQuickActions;
  bool doShowTextFormatOptions = false;

  String get title => titleController.text;
  Timer? debounce;

  @override
  void onInit() {
    super.onInit();

    var argument = Get.arguments;
    if (argument != null && argument is DbNotesModel) {
      note = argument; // Load the selected note
      titleController.text = note.title;

      try {
        // Ensure the note body is properly parsed before assigning to the controller
        Document document = Document.fromJson(jsonDecode(note.body));
        noteBodyController.document = document;
      } catch (e) {
        print("Error decoding JSON: $e");
        noteBodyController = QuillController.basic();
      }

      print("ARGUMENT: ${note.id}");
    }


    noteBodyController.addListener(() {
      final selection = noteBodyController.selection;

      if (selection.baseOffset != selection.extentOffset) {
        doShowTextFormatOptions = true;
        update();
      } else if(doShowTextFormatOptions) {
        doShowTextFormatOptions = false;
        update();
      }

      noteBodyController.document.changes.listen((_) => onTextChanged());

      onDocumentChanged();
    });

    moreQuickActions = getMoreQuickActions();
  }

  // Save changes and refresh the home screen
  Future<void> saveNote() async {
    final updatedBody = jsonEncode(noteBodyController.document.toDelta().toJson());

    // Ensure note fields are initialized properly
    final currentTitle = titleController.text;
    final currentBody = updatedBody;
    final previousTitle = note.title ?? "";
    final previousBody = note.body ?? "";

    // Check if any changes were made before updating
    if (currentTitle != previousTitle || currentBody != previousBody) {
      DbNotesModel updatedNote = DbNotesModel(
        id: note.id, // Keep the same ID
        title: currentTitle,
        body: currentBody,
        updatedOn: DateTime.now().toIso8601String(),
      );

      await db.updateNote(updatedNote); // ✅ Update note in database
      print("Note updated!");

      Get.back(result: updatedNote); // ✅ Pass the updated note back
    } else {
      Get.back(); // No changes, just go back
    }
  }


  Future<void> addOrUpdateNote() async {
    final json = jsonEncode(noteBodyController.document.toDelta().toJson());

    final newNote = DbNotesModel(
      id: note.id,
      title: titleController.text,
      body: json,
      updatedOn: DateTime.now().toIso8601String(),
    );

    if (note.id == null) {
      await db.insertNote(newNote);
      print("New Note Created");
    } else {
      await db.updateNote(newNote);
      print("Note Updated: ${note.id}");
    }

    // Pass the updated note back to refresh home screen
    // Get.back(result: noteTileController.saveNote);
  }

  Future<void> deleteNote(int id) async {
    await db.deleteNote(id);
  }

  void onTextChanged() {
    if (debounce?.isActive ?? false) debounce!.cancel();

    debounce = Timer(const Duration(seconds: 2), () {
      String newText = noteBodyController.document.toPlainText().trim();
      print("Updated Text: $newText");  // Replace this with your logic
    });
  }

  @override
  void dispose() {
    debounce?.cancel();
    noteBodyController.dispose();
    super.dispose();
  }

  void onDocumentChanged() {
    addOrUpdateNote();
  }
  List<NotesPageBottomSheetModel> getMoreQuickActions() {
    return [
      NotesPageBottomSheetModel(
        svgPath: SvgPathsConstants.checkmarkSquare,
        onTap: onTapUnchecked,
        title: "check_box".tr,
      ),
      NotesPageBottomSheetModel(
        svgPath: SvgPathsConstants.listNumbers,
        onTap: onTapOl,
        title: "numbered_list".tr,
      ),
      NotesPageBottomSheetModel(
        svgPath: SvgPathsConstants.listBullets,
        onTap: onTapUl,
        title: "bullet_list".tr,
      ),
      NotesPageBottomSheetModel(
        svgPath: SvgPathsConstants.codeSquare,
        onTap: onTapCodeBlock,
        title: "code_block".tr,
      ),
      NotesPageBottomSheetModel(
        svgPath: SvgPathsConstants.quoteSquare,
        onTap: onTapBlockQuote,
        title: "block_quote".tr,
      ),
    ];
  }

  void onTapQuickActions() {
    Get.bottomSheet(
      NotesPageBottomsheet(
        actionsList: moreQuickActions,
      ),
    );
  }

  void onTapUndo() {
    if (noteBodyController.hasUndo) {
      noteBodyController.undo();
    }
  }
  void onTapRedo() {
    if (noteBodyController.hasRedo) {
      noteBodyController.redo();
    }
  }
  void onTapUnchecked() {
    noteBodyController.formatSelection(Attribute.unchecked);
    Get.back();
  }
  void onTapOl() {
    noteBodyController.formatSelection(Attribute.ol);
    Get.back();
  }
  void onTapUl() {
    noteBodyController.formatSelection(Attribute.ul);
    Get.back();
  }
  void onTapCodeBlock() {
    noteBodyController.formatSelection(Attribute.codeBlock);
    Get.back();
  }
  void onTapBlockQuote() {
    noteBodyController.formatSelection(Attribute.blockQuote);
    Get.back();
  }
}


