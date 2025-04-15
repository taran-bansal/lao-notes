import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../common/models/widgets/db_notes_model.dart';
import '../../common/services/db.dart';
import '../notes/page.dart';

class HomeController extends GetxController {
  final DatabaseService db = DatabaseService();
  ScrollController notesListScrollController = ScrollController();

  List<DbNotesModel> notesList = [];
  List<DbNotesModel> highlightNotesList = [];
  List<DbNotesModel> favouriteNotesList = [];
  bool isLoading = true;
  bool isLoadingMore = true;
  bool hasLoadMore = true;

  @override
  void onInit() {
    super.onInit();
    init();

  }

  Future<void> init() async {
    await db.initDatabase(); // Open the database
    await fetchNotes();

    notesListScrollController.addListener(() {
      if (!isLoadingMore &&
          notesListScrollController.offset >
              (notesListScrollController.position.maxScrollExtent - 100)) {
        fetchNotes();
      }
    });
  }

  Future<void> fetchNotes() async {
    isLoadingMore = true;
    update();

    List<DbNotesModel> getNotesList = await db.getNotesList(
      limit: 10,
      offset: notesList.length,
    );

    print('NOTES COUNT: ${getNotesList.length}');

    // await Future.delayed(const Duration(seconds: 3));

    notesList.addAll(getNotesList);
    highlightNotesList.addAll(getNotesList);
    favouriteNotesList.addAll(getNotesList);
    isLoading = false;
    isLoadingMore = false;
    hasLoadMore = getNotesList.isNotEmpty;
    print(notesList.length);
    update();
  }

  // Navigate to Edit Page with a selected note
  void editNote(DbNotesModel note) {
    Get.toNamed('/addNotes', arguments: note);
  }

  void updateNoteInList(DbNotesModel note, int index) async {
    final updatedNote = await Get.to(() => const NotesPage(), arguments: note);
    if (updatedNote is DbNotesModel) {
      notesList.removeAt(index);
      notesList.insert(0, updatedNote);
      update();
    }
  }


}
