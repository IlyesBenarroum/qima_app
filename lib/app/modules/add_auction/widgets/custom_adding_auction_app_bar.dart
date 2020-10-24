import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'white-line.dart';

class CustomAddingAuctionAppbar extends StatelessWidget {
  const CustomAddingAuctionAppbar({
    @required this.child1,
    @required this.child2,
    @required this.child3,
    Key key,
  }) : super(key: key);
  final Widget child1;
  final Widget child2;
  final Widget child3;

  @override
  Widget build(BuildContext context) {
    var lang = Get.locale.languageCode;
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return AppBar(
      automaticallyImplyLeading: false,
      title: Padding(
        padding: EdgeInsets.only(top: screenHeight * 0.065),
        child: Container(
          height: screenHeight * 0.1,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: lang=="ar"?child1:child3,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: screenWidth * 0.024,
                                left: screenWidth * 0.05,
                                right: screenWidth * 0.05,
                              ),
                              child: WhiteLine(),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: child2,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: screenWidth * 0.024,
                                left: screenWidth * 0.05,
                                right: screenWidth * 0.05,
                              ),
                              child: WhiteLine(),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child:lang=="ar" ?child3:child1,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2,
              ),
              Stack(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        height: screenHeight * 0.025,
                        width: screenWidth * 0.17,
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Text(
                            'Offer_details'.tr,
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: screenHeight * 0.025,
                      width: screenWidth * 0.17,
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: Text(
                          "Auction_details".tr,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                      child: Container(
                        height: screenHeight * 0.025,
                        width: screenWidth * 0.17,
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Text("Offer_confirmation".tr),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      centerTitle: true,
      bottom: PreferredSize(
        preferredSize: Size(screenWidth, screenHeight * 0.03),
        child: Container(),
      ),
    );
  }
}
