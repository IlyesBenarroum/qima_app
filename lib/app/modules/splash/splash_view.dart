import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../app/modules/splash/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    SplashController().onInit();
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
