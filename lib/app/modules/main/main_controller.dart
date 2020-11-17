import 'package:get/get.dart';
import 'package:qima/app/models/auction_model.dart';
import '../../tools/tools.dart';

class MainController extends GetxController {
  @override
  void onInit() {}

  @override
  void onReady() {}

  @override
  void onClose() {
    CheckInternet.listener.cancel();
  }
}
