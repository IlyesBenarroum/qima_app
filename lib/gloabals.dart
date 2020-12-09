import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';

class Globals {
  static var firstCamera;
  static String country = "";
  static String provider = "42001";
  static String condition = "NEW";
  static String subscription = "POST_PAID";
  static String auctionDate = "${DateTime.now().toUtc()}";
  static final followBox = GetStorage();
  static final joinBox = GetStorage();
  static final auctionIdBox = GetStorage();

  static List<GlobalKey<FormState>> formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];
}
