import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qima/app/controllers/auction_controller.dart';

import '../../../../gloabals.dart';
import '../add_auction_controller.dart';

Widget factureUi() {
  final AddAuctionController controller = Get.put(AddAuctionController());
  final AuctionController auctionController = Get.put(AuctionController());
  double screenHeight = Get.height;
  double screenWidth = Get.width;
  return Padding(
    padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 3,
      child: Container(
        height: screenHeight * 0.08,
        width: screenWidth * 0.9,
        child: Row(
          children: <Widget>[
            Expanded(
              child: InkWell(
                focusColor: Colors.transparent,
                highlightColor: Colors.transparent,
                splashColor: Get.theme.primaryColor.withOpacity(0.2),
                onTap: () {
                  controller.isPostPaid.value = true;
                  // auctionController.setsubscription("POST_PAID");
                  Globals.subscription = "POST_PAID";
                  print(Globals.subscription);
                  // auctionController.setArrears(false);
                  // auctionController.setArrearsValue("0");
                },
                child: Container(
                  height: screenHeight * .08,
                  decoration: BoxDecoration(
                    color: controller.isPostPaid.value
                        ? Get.theme.primaryColor
                        : Colors.white,
                    borderRadius: BorderRadius.circular(10.00),
                  ),
                  child: Center(
                    child: Text(
                      "PostPaid".tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: controller.isPostPaid.value
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                focusColor: Colors.transparent,
                highlightColor: Colors.transparent,
                splashColor: Get.theme.primaryColor.withOpacity(0.2),
                onTap: () {
                  controller.isPostPaid.value = false;
                  Globals.subscription = "PRE_PAID";
                  print(Globals.subscription);
                  // auctionController.setsubscription("PRE_PAID");
                  // auctionController.auction.product.type = "PRE_PAID";

                  // auctionController.setPostPaid(false);
                },
                child: Container(
                  height: screenHeight * .08,
                  decoration: BoxDecoration(
                    color: !controller.isPostPaid.value
                        ? Get.theme.primaryColor
                        : Colors.white,
                    borderRadius: BorderRadius.circular(10.00),
                  ),
                  child: Center(
                    child: Text(
                      "PrePaid".tr,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: !controller.isPostPaid.value
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
