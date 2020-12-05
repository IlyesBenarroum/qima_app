import 'package:get/get.dart';

import '../../.././app/modules/auction_room/auction_live_controller.dart';

class AuctionLiveBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuctionLiveController>(
      () => AuctionLiveController(),
    );
  }
}
