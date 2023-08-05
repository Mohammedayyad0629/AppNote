import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:notesapp/constnt/text.dart';
import '../modles/note/note_modle.dart';
import '../notes/notes_controller.dart';

class AddNoteController extends GetxController {
  NotesController notesController = Get.find<NotesController>();
  XFile? noteImge;
  TextEditingController textNote = TextEditingController();
  RxInt maxLines = 1.obs;
  FocusNode focusNode = FocusNode();
  late int color;
  ImageSource? source;
  File? myimage;
  var isBold = false.obs;
  var textSize = 16.0.obs;

  void addNote(NoteModle note) {
    var notesBox = Hive.box<NoteModle>(kNameBox);
    notesBox.add(note);
    Get.offAllNamed('/home');
  }

  @override
  void refresh() {
    super.refresh();
  }

  void toggleBold() {
    isBold.value = !isBold.value;
  }

  var isItalic = false.obs;
  var selectedText = ''.obs;
  final isKeyboardVisible = false.obs;

  void checkKeyboardVisibility(bool isVisible) {
    isKeyboardVisible.value = isVisible;
  }

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      noteImge = image;
      File? img = File(image.path);
      img = await cropImage(imageFile: img);
      myimage = img;
    } on PlatformException catch (e) {
      print(e);
    }

    log('message');

    update();
  }

  Future<File?> cropImage({required File imageFile}) async {
    CroppedFile? croppedImage =
        await ImageCropper().cropImage(sourcePath: imageFile.path);
    if (croppedImage == null) return null;
    return File(croppedImage.path);
  }

  void toggleItalic() {
    isItalic.value = !isItalic.value;
  }

  void calculateMaxLines() {
    final text = textNote.text;
    final lineCount = text.split(RegExp(r'\n')).length;
    maxLines.value = lineCount;
  }

  @override
  void onInit() {
    color = Get.arguments['color'];
    super.onInit();
  }
}
