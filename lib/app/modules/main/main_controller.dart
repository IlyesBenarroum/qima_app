import 'package:get/get.dart';
import 'package:qima/app/models/auction_model.dart';
import '../../tools/tools.dart';

class MainController extends GetxController {
   List<Auction> listAuctions = List<Auction>().obs;
  @override
  void onInit() {}

  @override
  void onReady() {}

  @override
  void onClose() {
    CheckInternet.listener.cancel();
  }
}
