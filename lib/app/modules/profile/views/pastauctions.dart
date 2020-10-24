import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/widgets/card/auctioncard.dart';

class PastauctionsView extends GetView {
  const PastauctionsView({
    @required this.pastAuctionList,
    Key key,
  }) : super(key: key);
  final List pastAuctionList;
  @override
  Widget build(BuildContext context) {
    var lang = Get.locale.languageCode;

    return Container(
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
              itemBuilder: (context, index) => AuctionCard(
                //type 0 for main and created auctions
                //type 1 for joined
                //type 2 intersted auction
                type: 1,
                icon:
                    "https://upload.wikimedia.org/wikipedia/commons/2/28/Sillitoe-black-white.gif",
                number: '0912300000',
                info: "",
                asset: "",
                asset2: "",
                title: lang == "en"
                    ? "February".tr + " 03,2021"
                    : "February".tr + " 03, 2021",
                subtitle: null,
                title2: null,
                subtitle2: null,
                screenHeight: Get.height,
                screenWidth: Get.width,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
