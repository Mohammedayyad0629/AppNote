import 'package:get/get.dart';
import 'package:notesapp/first_screen/first_screen.dart';
import 'package:notesapp/home/home.dart';

import 'add_note/add_note.dart';
import 'medilewere/medilewere.dart';
import 'view&edit/view_edit.dart';

List<GetPage<dynamic>> routes = [
  GetPage(
      name: '/',
      page: () => const FirstScreen(),
      middlewares: [MyMedileWere()]),
  GetPage(name: '/home', page: () => const Home()),
  GetPage(name: '/addNote', page: () => const AddNote()),
  GetPage(name: '/viewEditNote', page: () => const ViewEditNote()),
];
