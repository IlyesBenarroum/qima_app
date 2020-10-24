import 'package:get/get.dart';

class DetailController extends GetxController {
  final count = 0.obs;
  var detail = true.obs;
  @override
  void onInit() {}

  @override
  void onReady() {}

  void toggleDetail(detail) {
    detail.value = !detail.value;
  }

  @override
  void onClose() {}

  increment() => count.value++;
}
