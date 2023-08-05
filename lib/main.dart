import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notesapp/modles/note/note_modle.dart';
import 'package:notesapp/routs.dart';
import 'constnt/color.dart';
import 'constnt/text.dart';
import 'medilewere/services.dart';
import 'modles/user/user_modle.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModleAdapter());
  Hive.registerAdapter(UserModleAdapter());

  await Hive.openBox<NoteModle>(kNameBox);
  await Hive.openBox<UserModle>('UserBox');
  await initServices();
  runApp(const NoteApp());
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  FlutterNativeSplash.remove();
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                brightness: Brightness.light,
                scaffoldBackgroundColor: kBackgroundColorLight),
            getPages: routes,
          );
        });
  }
}
