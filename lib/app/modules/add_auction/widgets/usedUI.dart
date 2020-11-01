import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qima/app/controllers/auction_controller.dart';

import '../add_auction_controller.dart';

Widget usedUi() {
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
                  controller.isUsed.value = true;
                  auctionController.setUsedPhone(true);
                  auctionController.setPostPaid(false);
                },
                child: Obx(
                  () => Container(
                    height: screenHeight * .1,
                    decoration: BoxDecoration(
                      color: controller.isUsed.value
                          ? Get.theme.primaryColor
                          : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "Used".tr,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: controller.isUsed.value
                              ? Colors.white
                              : Colors.black,
                        ),
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
                splashColor: Get.theme.primaryColor,
                onTap: () {
                  controller.isUsed.value = false;
                  controller.isPostPaid.value = false;
                  auctionController.setUsedPhone(false);
                  auctionController.setPostPaid(false);
                  auctionController.setArrears(false);
                  auctionController.setArrearsValue("0");
                },
                child: Obx(
                  () => Container(
                    height: screenHeight * 0.1,
                    decoration: controller.isUsed.value == false
                        ? BoxDecoration(
                            color: Get.theme.primaryColor,
                            borderRadius: BorderRadius.circular(10.00),
                          )
                        : BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.00),
                          ),
                    child: Center(
                      child: new Text(
                        "New".tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          // color: Color(0xff92a0ad),
                          color: !controller.isUsed.value
                              ? Colors.white
                              : Colors.black,
                        ),
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
