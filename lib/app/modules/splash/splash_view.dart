import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qima/app/controllers/auction_controller.dart';
import '../../../app/modules/splash/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  final AuctionController auctionController = Get.put(AuctionController());
  
  @override
  Widget build(BuildContext context) {
    SplashController().onInit();
    auctionController.onInit();
    // auctionController.getAuctions();
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 88.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: SvgPicture.asset("assets/images/Intersection 3.svg"),
            ),
          ),
          Center(
            child: SvgPicture.asset(
              "assets/images/logo.svg",
            ),
          ),
        ],
      ),
    );
  }
}
