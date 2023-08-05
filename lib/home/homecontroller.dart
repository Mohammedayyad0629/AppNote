import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:notesapp/constnt/color.dart';
import 'package:notesapp/constnt/imges.dart';
import 'package:notesapp/modles/user/user_modle.dart';
import '../constnt/text.dart';
import '../groups/groups.dart';
import '../modles/note/note_modle.dart';
import '../notes/notes.dart';

class HomeController extends GetxController {
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  DateTime timeBackPressed = DateTime.now();
  TextEditingController textSearch = TextEditingController();
  KeyboardVisibilityController keyboardVisibilityController =
      KeyboardVisibilityController();
  var isFabVisible = true.obs;
  var isKeyboardClosed = false.obs;
  File? myimage;
  List<NoteModle> notes = <NoteModle>[].obs;

  RxString userImage = ''.obs;
  getFavNotes() {
    var notesBox = Hive.box<NoteModle>(kNameBox);
    notes = notesBox.values.toList();
    notes.removeWhere((note) => note.isFavorite != true);
  }

  @override
  void refresh() {
    getFavNotes();
    super.refresh();
  }

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      File? img = File(image.path);
      img = await cropImage(imageFile: img);
      myimage = img;

      final box = Hive.box<UserModle>('UserBox');
      final textModel = UserModle(imageUser: image.path);
      box.put(0, textModel);
      userImage.value = image.path;

      // ignore: empty_catches
    } on PlatformException {}

    update();
  }

  getImage() {
    var userBox = Hive.box<UserModle>('UserBox');
    final savedText = userBox.get(0)?.imageUser;
    userImage.value = savedText ?? '';
  }

  Future<File?> cropImage({required File imageFile}) async {
    CroppedFile? croppedImage =
        await ImageCropper().cropImage(sourcePath: imageFile.path);
    if (croppedImage == null) return null;
    return File(croppedImage.path);
  }

  void toggleFabVisibility(bool isVisible) {
    isFabVisible.value = isVisible;
  }

  void setKeyboardClosed(bool closed) {
    isKeyboardClosed.value = closed;
  }

  List<Widget> pages = [const Notes(), const Groups()];
  RxInt currentIndex = 0.obs;
  List<String> text = ['Notes', 'Groups'];
  List<Widget> icon = [
    SvgPicture.asset(
      kNotesOffimges,
    ),
    SvgPicture.asset(kGroupimges),
  ];
  List<Widget> activeIcon = [
    SvgPicture.asset(kNotesimges),
    SvgPicture.asset(
      kGroupimges,
      color: kCorsserColor,
    ),
  ];
  @override
  void onInit() {
    getFavNotes();
    getImage();
    super.onInit();
  }
  // Future<bool> doubleExit() async {
  //   final difference = DateTime.now().difference(timeBackPressed);
  //   final isExitWarning = difference >= const Duration(seconds: 2);
  //   timeBackPressed = DateTime.now();
  //   if (isExitWarning) {
  //     const message = 'Press back again to exit';
  //     Fluttertoast.showToast(
  //         msg: message,
  //         fontSize: 18,
  //         backgroundColor: Colors.black.withOpacity(0.5));
  //     return false;
  //   } else {
  //     Fluttertoast.cancel();
  //     return true;
  //   }
  // }
}
