import 'package:get/get.dart';

import '../../.././app/modules/auctions/auction_controller.dart';

class AuctionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuctionController>(
      () => AuctionController(),
    );
  }
}
