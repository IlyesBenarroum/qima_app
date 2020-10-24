import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../.././app/modules/add_auction/add_auction_controller.dart';

import 'views/new_auction1_view.dart';

class AddAuctionView extends GetView<AddAuctionController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create_new_offer'.tr),
        elevation: 0,
        centerTitle: true,
      ),
      body: NewAuction1View(),
    );
  }
}
