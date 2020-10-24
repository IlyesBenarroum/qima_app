import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/modules/detail/detail3_view.dart';
import '../../../../app/widgets/card/auctioncard.dart';
import '../../../../app/widgets/notfoundwidget.dart';

class InterestedauctionsView extends GetView {
  const InterestedauctionsView({
    @required this.interestedAuctionList,
    Key key,
  }) : super(key: key);
  final List interestedAuctionList;
  @override
  Widget build(BuildContext context) {
    return interestedAuctionList.length == 0
        ? NotFoundWidget(
            title: "It_seems_you_are_not_interest_in_any_auction_so_far".tr,
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
                  child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) => GestureDetector(
                            onTap: () => Get.to(Detail3View()),
                            child: AuctionCard(
                              //type 0 for main and created auctions
                              //type 1 for joined
                              //type 2 intersted auction
                              type: 2,
                              icon:
                                  "https://upload.wikimedia.org/wikipedia/commons/2/28/Sillitoe-black-white.gif",
                              number: '0912300000',
                              info: "",
                              asset: "assets/images/icons/moneyIcon.svg",
                              asset2: "assets/images/icons/clock.svg",
                              title: "4000 " + "Pound".tr,
                              subtitle: null,
                              title2: "3:15",
                              subtitle2: null,
                              screenHeight: Get.height,
                              screenWidth: Get.width,
                            ),
                          )),
                ),
              ],
            ),
          );
  }
}
