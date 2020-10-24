import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../add_auction_controller.dart';

Widget factureUi() {
  final AddAuctionController controller = Get.put(AddAuctionController());

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
                  controller.isFactured.value = true;
                },
                child: Container(
                  height: screenHeight * .08,
                  decoration: BoxDecoration(
                    color: controller.isFactured.value
                        ? Get.theme.primaryColor
                        : Colors.white,
                    borderRadius: BorderRadius.circular(10.00),
                  ),
                  child: Center(
                    child: Text(
                      "PostPaid".tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: controller.isFactured.value
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
                  controller.isFactured.value = false;
                },
                child: Container(
                  height: screenHeight * .08,
                  decoration: BoxDecoration(
                    color: !controller.isFactured.value
                        ? Get.theme.primaryColor
                        : Colors.white,
                    borderRadius: BorderRadius.circular(10.00),
                  ),
                  child: Center(
                    child: Text(
                      "PrePaid".tr,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: !controller.isFactured.value
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
