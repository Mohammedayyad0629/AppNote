import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../notes/notes_controller.dart';
import 'view_edit_controller.dart';
import 'widget/app_bar_edit.dart';
import 'widget/body_edite_note.dart';
import 'widget/bottom_app_bar.dart';

class ViewEditNote extends StatelessWidget {
  const ViewEditNote({super.key});

  @override
  Widget build(BuildContext context) {
    NotesController notesController = Get.put(NotesController());
    Get.put(ViewEditNoteController());
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: GetBuilder<ViewEditNoteController>(
        builder: (controller) {
          return Scaffold(
            bottomNavigationBar: controller.myimage == null &&
                    controller.imge == null &&
                    controller.isEdite == true
                ? const BottomAppBarEdite()
                : null,
            body: Column(
              children: [
                AbbBarEdite(
                  isEdite: controller.isEdite,
                  onChenge: () {
                    controller.isEdite = true;
                    controller.refresh();
                  },
                  onSave: () {
                    notesController.notes[controller.index].body =
                        controller.textNote.text;
                    notesController.notes[controller.index].imageUrl =
                        controller.imge ?? controller.noteImge?.path;
                    notesController.notes[controller.index].save();
                    Get.offAllNamed('/home');
                  },
                ),
                const BodyEditeNote(),
              ],
            ),
          );
        },
      ),
    );
  }
}
