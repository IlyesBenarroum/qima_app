import 'package:get/get.dart';

class AuctionLiveController extends GetxController {
  
  final count = 0.obs;

  @override
  void onInit() {}

  @override
  void onReady() {}
  
  @override
  void onClose() {}

  increment() => count.value++;
}
