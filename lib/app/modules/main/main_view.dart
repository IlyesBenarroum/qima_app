import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/modules/add_auction/add_auction_view.dart';
import '../../../app/modules/detail/detail_view.dart';
import '../../../app/widgets/customappbar.dart';
import '../../widgets/notfoundwidget.dart';

import '../../widgets/card/auctioncard.dart';
import 'main_controller.dart';

class MainView extends GetView<MainController> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = Get.height;
    double screenWidth = Get.width;
    List auctionList = [1];
    var lang = Get.locale.languageCode;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight * 0.1),
        child: CustomAppBar(
          title: 'Welcome_to_Qima_App'.tr,
          screenHeight: screenHeight,
          screenWidth: screenWidth,
        ),
      ),
      body: auctionList.length == 0
          ? NotFoundWidget(
              title: 'There_are_no_offer_added_recently'.tr,
            )
          : Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.025,
                        horizontal: screenHeight * 0.035),
                    child: Text(
                      'Recently_added_offers'.tr,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Flexible(
                    child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          Get.to(DetailView());
                        },
                        child: AuctionCard(
                          //type 0 for main and created auctions
                          //type 1 for joined
                          //type 2 intersted auction
                          type: 0,
                          icon:
                              "https://upload.wikimedia.org/wikipedia/commons/2/28/Sillitoe-black-white.gif",
                          number: '0912300000',
                          info: 'Khartoum'.tr,
                          asset: "assets/images/icons/moneyIcon.svg",
                          asset2: "assets/images/icons/dateIcon.svg",
                          title: "4000 " + "Pound".tr,
                          subtitle: "Entry_price".tr,
                          title2: lang == "en"
                              ? "February".tr + " 03"
                              : "03 " + "February".tr,
                          subtitle2: "Auction_date".tr,
                          screenHeight: screenHeight,
                          screenWidth: screenWidth,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddAuctionView());
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
