import 'package:get/get.dart';

import 'auctions_controller.dart';

class AuctionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Auction_Controller>(
      () => Auction_Controller(),
    );
  }
}
