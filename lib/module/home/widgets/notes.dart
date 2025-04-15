import 'package:first_project/module/home/controller.dart';
import 'package:first_project/module/home/note_tile/note_tile.dart';
import 'package:flutter/material.dart';


class NotesList extends StatelessWidget {
  const NotesList({
    required this.title,
    required this.controller,
    super.key,
  });

  final String title;
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    if (controller.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (controller.notesList.isEmpty) {
      return const Center(
        child: Text("No notes found!"),
      );
    } else {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 16,),
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ],
          ),
          Expanded(
            child: ListView.separated(
              itemCount: controller.notesList.length + 1,
              controller: controller.notesListScrollController,
              padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 16
              ),
              itemBuilder: ( _ , index) {
                if (index >= controller.notesList.length) {
                  return controller.hasLoadMore ? const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Center(
                      child: SizedBox(
                        height: 30,
                        width: 30,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      ),
                    ),
                  ) : const SizedBox();
                }

                final note = controller.notesList[index];

                return Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: NoteTile(
                    index: index,
                    title: note.title,
                    body: note.body,
                    date: note.updatedOn,
                    onTap: () => controller.updateNoteInList(note, index),
                  ),
                );
              },
              separatorBuilder: (_, index) {
                return const SizedBox(
                  height: 15,
                );
              },
            ),
          ),
        ],
      );
    }
  }
}
