import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:qima/app/controllers/auction_controller.dart';
import 'package:qima/app/controllers/provider_controller.dart';
import 'package:qima/app/modules/add_auction/widgets/country_cutumDropDown.dart';
import 'package:qima/app/tools/popUps.dart';
import 'package:qima/app/tools/tools.dart';
import '../../../app/modules/add_auction/add_auction_view.dart';
import '../../../app/modules/detail/detail_view.dart';
import '../../../app/widgets/customappbar.dart';
import '../../widgets/notfoundwidget.dart';

import '../../widgets/card/auctioncard.dart';
import 'main_controller.dart';

class MainView extends GetView<MainController> {
  final AuctionController _controller = Get.put(AuctionController());
  final ProviderController providerController = Get.put(ProviderController());
  @override
  Widget build(BuildContext context) {
    double screenHeight = Get.height;
    double screenWidth = Get.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight * 0.1),
        child: CustomAppBar(
          title: 'Welcome_to_Qima_App'.tr,
          screenHeight: screenHeight,
          screenWidth: screenWidth,
        ),
      ),
      body: Obx(
        () => _controller.auctionsList.length == 0
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
                      child: CustomRefreshWidget(
                          controller: _controller,
                          screenHeight: screenHeight,
                          screenWidth: screenWidth),
                    ),
                  ],
                ),
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
    return RefreshIndicator(
      onRefresh: auctionController.getAuctions,
      child: ListView.builder(
        itemCount: widget._controller.auctionsList.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              Get.to(DetailView(index: index));
            });
          },
          child: AuctionCard(
            //type 0 for main and created auctions
            //type 1 for joined
            //type 2 intersted auction
            type: 0,
            icon:
                "https://upload.wikimedia.org/wikipedia/commons/2/28/Sillitoe-black-white.gif",
            number:
                //  "05402220103",
                "${widget._controller.auctionsList[index].getProduct.specialNumber}",
            info:
                //  '000',
                "${widget._controller.auctionsList[index].getProduct.country}",
            asset: "assets/images/icons/moneyIcon.svg",
            asset2: "assets/images/icons/dateIcon.svg",
            title:
                // "0"
                "${widget._controller.auctionsList[index].entryPrice} " +
                    "Pound".tr,
            subtitle: "Entry_price".tr,
            title2:
                // "0",
                "${widget._controller.auctionsList[index].getAuctionDate.substring(0, 10)}",
            subtitle2: "Auction_date".tr,
            screenHeight: widget.screenHeight,
            screenWidth: widget.screenWidth,
          ),
        ),
      ),
    );
  }
}
