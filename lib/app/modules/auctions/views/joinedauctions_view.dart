import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/modules/detail/detail2_view.dart';
import '../../../../app/widgets/card/auctioncard.dart';
import '../../../../app/widgets/notfoundwidget.dart';

class JoinedauctionsView extends GetView {
  const JoinedauctionsView({
    @required this.joinedAuctionList,
    Key key,
  }) : super(key: key);
  final List joinedAuctionList;
  @override
  Widget build(BuildContext context) {
    return joinedAuctionList.length == 0
        ? NotFoundWidget(
            title: "It_seems_you_did_not_join_any_auction_so_far".tr,
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
                      onTap: () => Get.to(Detail2View(
                        index: index,
                      )),
                      child: AuctionCard(
                        //type 0 for main and created auctions
                        //type 1 for joined
                        //type 2 intersted auction
                        type: 1,
                        icon:
                            "https://upload.wikimedia.org/wikipedia/commons/2/28/Sillitoe-black-white.gif",
                        number: '0912300000',
                        info: "",
                        asset: "assets/images/icons/clock.svg",
                        asset2: "",
                        title: "3:15",
                        //  title2: "3:15",
                        subtitle: null,
                        title2: null,
                        subtitle2: null,
                        screenHeight: Get.height,
                        screenWidth: Get.width,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
