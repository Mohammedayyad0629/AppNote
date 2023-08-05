import 'dart:developer';

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:notesapp/constnt/color.dart';

import '../constnt/text.dart';
import '../modles/note/note_modle.dart';

class NotesController extends GetxController {
  RxList<NoteModle> notes = <NoteModle>[].obs;
  int indexType = 0;

  void searchNotes(String searchText) {
    getAllNotes();
    notes.value = notes
        .where((note) =>
            note.body.toLowerCase().contains(searchText.toLowerCase()))
        .toList();
    log('${notes}');
  }

  void workFilteredNotes() {
    getAllNotes();
    notes.removeWhere((note) => note.colorType != kWorkColor.value);
    indexType = 1;
  }

  void personalFilteredNotes() {
    getAllNotes();

    notes.removeWhere((note) => note.colorType != kPersonalColor.value);
    indexType = 2;
  }

  void meetingFilteredNotes() {
    getAllNotes();

    notes.removeWhere((note) => note.colorType != kMeetingColor.value);
    indexType = 3;
  }

  void shoppingFilteredNotes() {
    getAllNotes();
    notes.removeWhere((note) => note.colorType != kShoppingColor.value);
    indexType = 4;
  }

  getAllNotes() {
    var notesBox = Hive.box<NoteModle>(kNameBox);
    notes.value = notesBox.values.toList();
    indexType = 0;
  }

  @override
  void refresh() {
    getAllNotes();
    super.refresh();
  }

  @override
  void onInit() {
    getAllNotes();
    refresh();
    super.onInit();
  }
}
