import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../tools/constants.dart';

double screenWidth = Get.width;
double screenHeight = Get.height;

class AuctionRoomCardView extends GetView {
  const AuctionRoomCardView({
    @required this.joiners,
    @required this.name,
    @required this.bid,
    Key key,
  }) : super(key: key);
  final int joiners;
  final String name;
  final String bid;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.05,
        vertical: screenWidth * 0.025,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          //image
          Container(
            height: screenWidth * 0.1,
            width: screenWidth * 0.1,
            decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                    fit: BoxFit.fill,
                    image: new NetworkImage(
                        "https://upload.wikimedia.org/wikipedia/commons/2/28/Sillitoe-black-white.gif"))),
          ),
          SizedBox(
            width: screenWidth * 0.025,
          ),
          //info
          Container(
            width: screenWidth * 0.75,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                //name date
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: screenWidth * 0.3,
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: Text(
                          "$name",
                          textAlign: TextAlign.right,
                          style: Constants.kLiveAuctionCardNameTextStyle,
                        ),
                      ),
                    ),
                    // Container(
                    //   width: screenWidth * .15,
                    //   child: FittedBox(
                    //     fit: BoxFit.scaleDown,
                    //     child: Text(
                    //       // " 10" + "m".tr + " 23" + "S".tr,
                    //       "10:23",
                    //       // textDirection: TextDirection.rtl,
                    //       // textAlign: TextAlign.right,
                    //       style: Constants.kLiveAuctionCardTimeTextStyle,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                //price
                Container(
                  height: screenHeight * 0.045,
                  width: screenWidth * .25,
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Center(
                    child: Container(
                      height: screenHeight * 0.035,
                      width: screenWidth * .175,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "$bid" + "Pound".tr,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
