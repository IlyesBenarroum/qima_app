import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/modules/detail/detail2_view.dart';
import '../../../../app/widgets/card/auctioncard.dart';
import '../../../../app/widgets/notfoundwidget.dart';

class CreatedauctionsView extends GetView {
  const CreatedauctionsView({
    @required this.createdAuctionList,
    Key key,
  }) : super(key: key);
  final List createdAuctionList;
  @override
  Widget build(BuildContext context) {
    var lang = Get.locale.languageCode;
    return createdAuctionList.length == 0
        ? NotFoundWidget(
            title: "Looks_like_you_have_not_created_an_auction_yet".tr,
          )
        : Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 30,
                ),
                Flexible(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () => Get.to(Detail2View()),
                        child: AuctionCard(
                          //type 0 for main and created auctions
                          //type 1 for joined
                          //type 2 intersted auction
                          type: 0,
                          icon:
                              "https://upload.wikimedia.org/wikipedia/commons/2/28/Sillitoe-black-white.gif",
                          number: '0912300000',
                          info: lang == "en"
                              ? "February".tr + " 03,2021"
                              : "February".tr + " 03, 2021",
                          asset: "assets/images/icons/hammer.svg",
                          asset2: "assets/images/icons/heart.svg",
                          title: "400",
                          subtitle: "Entrants".tr,
                          title2: "300",
                          subtitle2: "Interested".tr,
                          screenHeight: Get.height,
                          screenWidth: Get.width,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Get.to(Detail2View()),
                        child: AuctionCard(
                          //type 0 for main and created auctions
                          //type 1 for joined
                          //type 2 intersted auction
                          type: 0,
                          icon:
                              "https://upload.wikimedia.org/wikipedia/commons/2/28/Sillitoe-black-white.gif",
                          number: '0912300000',
                          info: "In_Review".tr,
                          asset: "assets/images/icons/auctionIcon.svg",
                          asset2: "assets/images/icons/EmptyHeart.svg",
                          title: "0",
                          subtitle: "Entrants".tr,
                          title2: "0",
                          subtitle2: "Interested".tr,
                          screenHeight: Get.height,
                          screenWidth: Get.width,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Get.to(Detail2View()),
                        child: AuctionCard(
                          //type 0 for main and created auctions
                          //type 1 for joined
                          //type 2 intersted auction
                          type: 0,
                          icon:
                              "https://upload.wikimedia.org/wikipedia/commons/2/28/Sillitoe-black-white.gif",
                          number: '0912300000',
                          info: "Rejected".tr,
                          asset: "assets/images/icons/auctionIcon.svg",
                          asset2: "assets/images/icons/EmptyHeart.svg",
                          title: "0",
                          subtitle: "Entrants".tr,
                          title2: "0",
                          subtitle2: "Interested".tr,
                          screenHeight: Get.height,
                          screenWidth: Get.width,
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
