import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/tools/popUps.dart';

import '../widgets/custom_adding_auction_app_bar.dart';
import '../widgets/white_circle_container.dart';

double screenHeight = Get.height;
double screenWidth = Get.width;

class NewAuction3View extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create_new_offer'.tr),
        elevation: 0,
        centerTitle: true,
      ),
      body: NewAuction3BodyView(),
    );
  }
}

class NewAuction3BodyView extends StatelessWidget {
  const NewAuction3BodyView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(screenWidth, screenHeight * 0.11),
        child: CustomAddingAuctionAppbar(
          child1: WhiteCircleContainer(),
          child2: WhiteCircleContainer(),
          child3: WhiteCircleContainer(),
        ),
      ),
      body: createAccount(),
    );
  }
}
