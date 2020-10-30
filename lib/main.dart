import 'dart:ui' as ui;

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qima/generated/locales.g.dart';

import 'app/routes/app_pages.dart';
import 'package:get_storage/get_storage.dart';
import 'gloabals.dart';

Future<void> main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  Globals.firstCamera = cameras.first;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Qima",
      translationsKeys: AppTranslation.translations,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      locale: ui.window.locale,
      fallbackLocale: Locale('en'),
      builder: (context, navigator) {
        var lang = Get.locale.languageCode;
        return Theme(
          data: ThemeData(
            fontFamily: lang == "en" ? "Roboto" : "Speda",
            scaffoldBackgroundColor: const Color(0xFFFFFFFF),
            primaryColor: Color(0xff1B7CB2),
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          child: navigator,
        );
      },
    );
  }
}
