import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/modules/OnBoarding/controllers/on_boarding_controller.dart';

class OnBoardingView extends GetView<OnBoardingController> {
  @override
  Widget build(BuildContext context) {
    OnBoardingController().onInit();
    return Scaffold(
      appBar: AppBar(
        title: Text('OnBoardingView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'OnBoardingView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
