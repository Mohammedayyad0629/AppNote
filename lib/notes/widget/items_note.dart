import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bodynote.dart';
import 'titletypenote.dart';
import '../notes_controller.dart';

import 'no_notes.dart';

class ItemsNote extends GetView<NotesController> {
  const ItemsNote({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotesController>(
        builder: (controller) => controller.notes.isNotEmpty
            ? const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [TitleTypeNote(), BodyNote()],
                ),
              )
            : const NoNotes());
  }
}
