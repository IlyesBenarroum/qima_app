import 'package:get/get.dart';
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
