import 'dart:convert';

import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';

import '../../../common/models/widgets/db_notes_model.dart';
import '../controller.dart';

class NoteTileController extends GetxController {

  // final DatabaseService db = DatabaseService();

  QuillController noteBodyController = QuillController.basic();

  final String body;

  List<DbNotesModel> notesList = [];

  NoteTileController(this.body);

  @override
  void onInit() {

    super.onInit();
    Document document = Document.fromJson(jsonDecode(body));
    noteBodyController.document = document;

  }

}