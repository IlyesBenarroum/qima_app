import 'package:get/get.dart';
import '../models/auction_model.dart';

class AuctionsController extends GetxController {
  var auctionsList = [].obs;

  void addAuction(Auction auction) {
    auctionsList.add(auction);
    auctionsList.refresh();
  }

  @override
  void onInit() {}

  @override
  void onReady() {}

  @override
  void onClose() {}
}
