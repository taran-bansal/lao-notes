
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';

import 'note_tile_controller.dart';

class NoteTile extends StatelessWidget {
  const NoteTile({
    required this.index,
    required this.title,
    required this.body,
    required this.date,
    this.onTap,
    super.key});

  final int index;
  final String title;
  final String body;
  final String date;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NoteTileController>(
      key: ValueKey("$title-$index-$body"),
      init: NoteTileController(body),
      global: false,
      builder: (controller) {
        return InkWell(
          onTap: onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                maxLines: 2,
              ),
              const SizedBox(height: 10,),
              AbsorbPointer(
                absorbing: true,
                child: Opacity(
                  opacity: 0.7,
                  child: Container(
                    constraints: const BoxConstraints(
                      maxHeight: 200,
                    ),
                    child: Stack(
                      children: [
                        QuillEditor.basic(
                          controller: controller.noteBodyController,
                        ),
                        Positioned.fill(
                          // child: Container(color: Colors.lightBlue.shade50.withOpacity(0.5)),
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.grey.shade100.withOpacity(0),
                                  Colors.grey.shade100.withOpacity(0.9),
                                ],
                                stops: const [0.5, 1],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              IntrinsicHeight(
                child: Row(
                  children: [
                    const Text("Design", style: TextStyle(fontSize: 12,color: Colors.grey),),
                    const VerticalDivider(),
                    const Text("Wireframe", style: TextStyle(fontSize: 12,color: Colors.grey),),
                    Expanded(child: Text(date, style: const TextStyle(fontSize: 12,color: Colors.grey,),textAlign: TextAlign.end,)),
                  ],
                ),
              ),
            ],
          ),
        );
      });
  }
}
