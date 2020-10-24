import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAuctionController extends GetxController {
  final Map<String, Widget> countryData = Map.fromIterables(
    [
      'Afghanistan'.tr,
      'Albania'.tr,
      'Algeria'.tr,
    ],
    [
      Image.asset("assets/images/icons/af.png"),
      Image.asset("assets/images/icons/al.png"),
      Image.asset("assets/images/icons/dz.png"),
    ],
  );
  final List<String> serviceProviderData = [
    "Zain".tr,
    "Stc".tr,
    "Mobily".tr,
    "Lebara".tr
  ];
  var arrearsValue = 0.obs;
  final List<String> arrears = [
    "No".tr,
    "Yes".tr,
  ];
  TextEditingController phoneController;
  TextEditingController arrearsController;
  TextEditingController auctionEntryPrice;
  var numberVisibility = true.obs;
  var isUsed = false.obs;
  var isFactured = false.obs;
  var isArrears = false.obs;
  var arrearsVisibility = true.obs;
  var autoValidate = false.obs;
  var auctionPeriod = 10.obs;
  var pickedDate = DateTime.now().obs;
  var pickedTime = DateTime.now().obs;
  @override
  void onInit() {
    phoneController = TextEditingController();
    arrearsController = TextEditingController();
    auctionEntryPrice = TextEditingController();
    update(['country']);
    update(['service_providers']);
    update(['arrears']);
  }

  void addAuctionPeriod(var time) {
    if (auctionPeriod.value < 120) auctionPeriod.value += time;
  }

  void minusAuctionPeriod(var time) {
    if (auctionPeriod.value > 30) auctionPeriod.value += time;
  }

  @override
  void onReady() {}

  @override
  void onClose() {
    phoneController.dispose();
    arrearsController.dispose();
    auctionEntryPrice.dispose();
    super.onClose();
  }
}
