import 'package:get/get.dart';

class NotificationController extends GetxController {

  final count = 0.obs;

  @override
  void onInit() {}

  @override
  void onReady() {}

  @override
  void onClose() {}

  increment() => count.value++;
}
