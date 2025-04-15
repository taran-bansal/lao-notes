import 'package:first_project/common/models/widgets/notes_page_bottom_sheet_model.dart';
import 'package:first_project/ui_kit/icon/index.dart';
import 'package:flutter/material.dart';


class BottomsheetOptions extends StatelessWidget {
  const BottomsheetOptions({
      required this.data,
      super.key,
      });

  final NotesPageBottomSheetModel data;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: data.onTap,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                children: [
                  LNIcon(
                    path: data.svgPath,
                    size: 24,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Text(
                    data.title,
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
            const Divider(
              indent: 40,
              height: 1,
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }
}
