import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesapp/notes/widget/items_note.dart';
import 'notes_controller.dart';

class Notes extends StatelessWidget {
  const Notes({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotesController());
    return const ItemsNote();
  }
}
