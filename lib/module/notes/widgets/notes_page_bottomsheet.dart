import 'package:first_project/common/models/widgets/notes_page_bottom_sheet_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/constants/svg_paths.dart';
import '../../../ui_kit/icon/index.dart';
import 'bottomsheet_options.dart';

class NotesPageBottomsheet extends StatelessWidget {
  const NotesPageBottomsheet({
    required this.actionsList,
    super.key,
  });

  final List<NotesPageBottomSheetModel> actionsList;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 20),
      margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 10,
            width: 50,
            margin: const EdgeInsets.symmetric(vertical: 8,),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "quick_actions".tr,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Transform.translate(
                offset: const Offset(8, 0),
                child: LNIcon(
                  path: SvgPathsConstants.cancel,
                  onTap: Get.back,
                ),
              ),
            ],
          ),

          for (int i = 0; i < actionsList.length; i++) ...{
            BottomsheetOptions(
              data: actionsList[i],
            ),
          }
        ],
      ),
    );
  }
}
