import 'package:flutter/widgets.dart';

class Globals {
  static var firstCamera;
  static String country = "";
  static String provider = "42001";
  static String condition = "NEW";
  static String subscription = "POST_PAID";
  static List<GlobalKey<FormState>> formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];
}
