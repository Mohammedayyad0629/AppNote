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

class ViewEditNoteController extends GetxController {
  XFile? noteImge;
  String? imge;
  late TextEditingController textNote;
  bool isEdite = false;
  RxInt maxLines = 1.obs;
  FocusNode focusNode = FocusNode();
  late int color;
  ImageSource? source;
  File? myimage;
  late String bodyNote;
  late int index;
  List<NoteModle> notes = <NoteModle>[].obs;
  void addNote(NoteModle note) {
    var notesBox = Hive.box<NoteModle>(kNameBox);
    notesBox.add(note);
  }

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      noteImge = image;
      File? img = File(image.path);
      img = await cropImage(imageFile: img);
      myimage = img;
      // ignore: empty_catches
    } on PlatformException {}

    log('message');

    update();
  }

  Future<File?> cropImage({required File imageFile}) async {
    CroppedFile? croppedImage =
        await ImageCropper().cropImage(sourcePath: imageFile.path);
    if (croppedImage == null) return null;
    return File(croppedImage.path);
  }

  @override
  void refresh() {
    super.refresh();
  }

  @override
  void onInit() {
    color = Get.arguments['color'];
    bodyNote = Get.arguments['bodyNote'];
    imge = Get.arguments['noteImge'];
    index = Get.arguments['index'];
    textNote = TextEditingController(text: bodyNote);
    super.onInit();
  }
}
