import 'package:get/get.dart';

import '../../.././app/modules/add_auction/add_auction_controller.dart';

class AddAuctionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddAuctionController>(
      () => AddAuctionController(),
    );
  }
}
