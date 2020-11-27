import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../.././app/modules/auction_live/auction_live_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../.././app/modules/auction_live/widgets/auction_room_card_view.dart';
import '../../.././app/widgets/customappbar.dart';
import '../../tools/constants.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:share/share.dart';

final double screenHeight = Get.height;
final double screenWidth = Get.width;

String text = 'Qima';
String subject = 'Win Auction with friends';

class AuctionLiveView extends GetView<AuctionLiveController> {
  final GlobalKey<AnimatedCircularChartState> _chartKey =
      new GlobalKey<AnimatedCircularChartState>();

  @override
  Widget build(BuildContext context) {
    var firstPrice = false.obs;
    var secondPrice = false.obs;
    var thirdPrice = false.obs;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight * 0.1),
        child: CustomAppBar(
          title: 'Auction_room'.tr,
          screenHeight: screenHeight,
          screenWidth: screenWidth,
          leading: null,
          action: IconButton(
            onPressed: () {
              Share.share(
                text,
                subject: subject,
                // sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
              );
            },
            tooltip: "Share with Friends",
            icon: Icon(
              Icons.share,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: screenHeight,
            width: screenWidth,
            color: Colors.transparent,
          ),
          //images

          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: screenHeight * .3,
              width: screenWidth,
              child: Image.network(
                "https://upload.wikimedia.org/wikipedia/commons/2/28/Sillitoe-black-white.gif",
                fit: BoxFit.fill,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 5,
                sigmaY: 5,
              ),
              child: Container(
                height: screenHeight * .3,
                width: screenWidth,
                color: Colors.black.withOpacity(0.4),
              ),
            ),
          ),

          //phone number
          Positioned(
            top: screenHeight * 0.05,
            left: screenWidth * 0.125,
            right: screenWidth * 0.125,
            child: Container(
              height: screenHeight * 0.1,
              width: screenWidth * 0.75,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(5)),
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  "0912300000",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          //price card
          Positioned(
            top: screenHeight * 0.2,
            left: screenWidth * 0.05,
            right: screenWidth * 0.05,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 5,
              child: Container(
                height: screenHeight * 0.125,
                width: screenWidth * 0.9,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: screenWidth * 0.26,
                        height: screenHeight * 0.055,
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Text(
                            " 680 " + "Pound".tr,
                            style: Constants.kAuctionInfoTitleTextStyle,
                          ),
                        ),
                      ),
                      Container(
                        width: screenWidth * 0.2,
                        height: screenHeight * 0.035,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            "Current_bid".tr,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          //top info
          Positioned(
            top: screenHeight * 0.35,
            left: screenWidth * 0.05,
            right: screenWidth * 0.05,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                //top of this list
                Row(
                  children: [
                    SvgPicture.asset("assets/images/icons/notifIcon.svg"),
                    Text(
                      " 10 " + "Bidders".tr,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: screenHeight * 0.06,
                  width: screenHeight * 0.06,
                  child: Stack(
                    children: [
                      AnimatedCircularChart(
                        key: _chartKey,
                        size: Size(screenHeight * 0.06, screenHeight * 0.06),
                        initialChartData: <CircularStackEntry>[
                          new CircularStackEntry(
                            <CircularSegmentEntry>[
                              new CircularSegmentEntry(
                                90, // value of time to update
                                Get.theme.primaryColor,
                                rankKey: 'remaining',
                              ),
                            ],
                            rankKey: 'progress',
                          ),
                        ],
                        holeLabel: "20د",
                        labelStyle: Constants.kAuctionInfoTitleTextStyle,
                        chartType: CircularChartType.Radial,
                        edgeStyle: SegmentEdgeStyle.round,
                        percentageValues: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned.fill(
            top: screenHeight * 0.425,
            child: Container(
              child: ListView.builder(
                itemCount: 18,
                itemBuilder: (context, index) => AuctionRoomCardView(),
              ),
            ),
          ),
          //bid
          Positioned(
            left: screenWidth * 0.05,
            right: screenWidth * 0.05,
            bottom: screenHeight * 0.025,
            child: InkWell(
              onTap: () {
                firstPrice.value = false;
                secondPrice.value = false;
                thirdPrice.value = false;
              },
              child: Obx(
                () => AnimatedContainer(
                  duration: Duration(milliseconds: 0),
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * .9,
                  decoration: BoxDecoration(
                    color: firstPrice.value ||
                            secondPrice.value ||
                            thirdPrice.value
                        ? Get.theme.primaryColor
                        : Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0.00, 2.00),
                        color: Colors.white,
                        blurRadius: 4,
                      ),
                    ],
                    border: Border.all(
                      color: Get.theme.primaryColor,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10.00),
                  ),
                  child: Center(
                    child: Text(
                      "Bid_now".tr,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: firstPrice.value ||
                                secondPrice.value ||
                                thirdPrice.value
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          //bid price
          Positioned(
            bottom: MediaQuery.of(context).size.height * .125,
            left: screenWidth * .075,
            right: screenWidth * .075,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    // setState(() {
                    firstPrice.value = false;
                    secondPrice.value = false;
                    thirdPrice.value = true;
                    // });
                  },
                  child: Obx(
                    () => Container(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.25,
                      decoration: BoxDecoration(
                        color: thirdPrice.value
                            ? Get.theme.primaryColor
                            : Color(0xffffffff),
                        border: Border.all(
                          width: 2.00,
                          color: Get.theme.primaryColor,
                        ),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0.00, 3.00),
                            color: Color(0xff000000).withOpacity(0.16),
                            blurRadius: 8,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(5.00),
                      ),
                      child: Center(
                        child: new Text(
                          "500",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: thirdPrice.value
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    firstPrice.value = false;
                    secondPrice.value = true;
                    thirdPrice.value = false;
                  },
                  child: Obx(
                    () => new Container(
                      height: screenHeight * 0.06,
                      width: screenWidth * 0.25,
                      decoration: BoxDecoration(
                        color: secondPrice.value
                            ? Get.theme.primaryColor
                            : Color(0xffffffff),
                        border: Border.all(
                          width: 2.00,
                          color: Get.theme.primaryColor,
                        ),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0.00, 3.00),
                            color: Color(0xff000000).withOpacity(0.16),
                            blurRadius: 8,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(5.00),
                      ),
                      child: Center(
                        child: new Text(
                          "200",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: secondPrice.value
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    firstPrice.value = true;
                    secondPrice.value = false;
                    thirdPrice.value = false;
                  },
                  child: Obx(
                    () => new Container(
                      height: screenHeight * 0.06,
                      width: screenWidth * 0.25,
                      decoration: BoxDecoration(
                        color: firstPrice.value
                            ? Get.theme.primaryColor
                            : Color(0xffffffff),
                        border: Border.all(
                          width: 2.00,
                          color: Get.theme.primaryColor,
                        ),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0.00, 3.00),
                            color: Color(0xff000000).withOpacity(0.16),
                            blurRadius: 8,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(5.00),
                      ),
                      child: Center(
                        child: new Text(
                          "100",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: firstPrice.value
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
        ],
      ),
    );
  }
}
