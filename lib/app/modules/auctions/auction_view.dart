import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../.././app/modules/auctions/auction_controller.dart';
import '../../.././app/widgets/auctioncustomappbar.dart';

import 'views/createdauctions_view.dart';
import 'views/interestedauctions_view.dart';
import 'views/joinedauctions_view.dart';

class AuctionView extends GetView<AuctionController> {
  @override
  Widget build(BuildContext context) {
    final List<Tab> myTabs = <Tab>[
      Tab(
        child: CreatedauctionsView(),
      ),
      Tab(
        child: JoinedauctionsView(),
      ),
      Tab(
        child: InterestedauctionsView(),
      ),
    ];

    double screenHeight = Get.height;

    return DefaultTabController(
      initialIndex: 2,
      length: myTabs.length,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(screenHeight * 0.20),
          child: AuctionCustomAppbar(
              first: "Created_by_you".tr,
              second: "Joined_to".tr,
              third: "Interested_in_it".tr,
              title: 'Auctions'.tr,
              screenHeight: screenHeight),
        ),
        body: TabBarView(children: myTabs),
      ),
    );
  }
}
