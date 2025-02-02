import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qima/app/controllers/auction_controller.dart';
import 'package:qima/app/modules/add_auction/widgets/country_cutumDropDown.dart';

import '../../../../app/modules/detail/detail3_view.dart';
import '../../../../app/widgets/card/auctioncard.dart';
import '../../../../app/widgets/notfoundwidget.dart';

double screenHeight = Get.height;
double screenWidth = Get.width;

class InterestedauctionsView extends GetView {
  final AuctionController _controller = Get.put(AuctionController());

  @override
  Widget build(BuildContext context) {
    _controller.getIntressetedAuctions();
    print("follow length ${_controller.intressetList.length}");
    return Obx(
      () => _controller.intressetList.length == 0
          ? NotFoundWidget(
              title: "It_seems_you_are_not_interest_in_any_auction_so_far".tr,
            )
          : Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Flexible(
                    child: CustomRefreshWidget(
                        controller: _controller,
                        screenHeight: screenHeight,
                        screenWidth: screenWidth),
                  ),
                ],
              ),
            ),
    );
  }
}

class CustomRefreshWidget extends StatefulWidget {
  const CustomRefreshWidget({
    Key key,
    @required AuctionController controller,
    @required this.screenHeight,
    @required this.screenWidth,
  })  : _controller = controller,
        super(key: key);

  final AuctionController _controller;
  final double screenHeight;
  final double screenWidth;

  @override
  _CustomRefreshWidgetState createState() => _CustomRefreshWidgetState();
}

class _CustomRefreshWidgetState extends State<CustomRefreshWidget> {
  @override
  Widget build(BuildContext context) {
    setState(() {
      // auctionController.getIntressetedAuctions();
    });
    return RefreshIndicator(
      onRefresh: auctionController.getIntressetedAuctions,
      child: ListView.builder(
        itemCount: widget._controller.intressetList.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            // setState(() {
            Get.to(Detail3View(auction: widget._controller.intressetList[index]));
            // });
          },
          child: AuctionCard(
            //type 0 for main and created auctions
            //type 1 for joined
            //type 2 intersted auction
            type: 2,
            icon:
                "https://upload.wikimedia.org/wikipedia/commons/2/28/Sillitoe-black-white.gif",
            number:
                //  "05402220103",
                "${widget._controller.intressetList[index].getProduct.specialNumber}",
            info:
                //  '000',
                "${widget._controller.intressetList[index].getProduct.country}",
            asset: "assets/images/icons/moneyIcon.svg",
            asset2: "assets/images/icons/dateIcon.svg",
            title:
                // "0"
                "${widget._controller.intressetList[index].entryPrice} " +
                    "Pound".tr,
            subtitle: "Entry_price".tr,
            title2:
                // "0",
                "${widget._controller.intressetList[index].getAuctionDate.substring(0, 10)}",
            subtitle2: "Auction_date".tr,
            screenHeight: widget.screenHeight,
            screenWidth: widget.screenWidth,
          ),
        ),
      ),
    );
  }
}
