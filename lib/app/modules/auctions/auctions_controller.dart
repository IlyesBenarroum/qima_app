import 'package:get/get.dart';
import 'package:qima/app/controllers/auction_controller.dart';

class Auction_Controller extends GetxController {
  
  final count = 0.obs;

  @override
  void onInit() {
    // AuctionController().g.
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  increment() => count.value++;
}
