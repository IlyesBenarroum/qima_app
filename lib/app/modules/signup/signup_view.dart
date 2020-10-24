import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/modules/signup/signup_controller.dart';
import '../../../app/modules/signup/views/login_form_view.dart';

import 'views/signup_form_view.dart';
import 'widgets/socialmedia_card.dart';

double screenHeight = Get.height;
double screenWidth = Get.width;

class SignupView extends GetView<SignupController> {
  final SignupController controller = Get.put(SignupController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: screenHeight,
              width: screenWidth,
              color: Colors.white,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: screenWidth,
                height: screenHeight * 0.68,
                color: Get.theme.primaryColor,
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.06),
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    height: screenHeight * 0.82,
                    width: screenWidth * 0.9,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: screenHeight * 0.1,
                          width: screenWidth * 0.8,
                          color: Colors.blueGrey,
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  controller.signup.value = true;
                                },
                                child: Container(
                                  height: screenHeight * 0.82,
                                  width: screenWidth * 0.4,
                                  color: Colors.white,
                                  child: Stack(
                                    children: [
                                      Container(
                                        height: screenHeight * 0.1,
                                        width: screenWidth * 0.4,
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Obx(
                                          () => Text(
                                            "Signup".tr,
                                            style: TextStyle(
                                              color: controller.signup.value
                                                  ? Get.theme.primaryColor
                                                  : Get.theme.primaryColor
                                                      .withOpacity(0.5),
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Obx(
                                          () => Visibility(
                                            visible: controller.signup.value
                                                ? true
                                                : false,
                                            child: Container(
                                              height: 2,
                                              width: screenWidth * 0.25,
                                              color: Get.theme.primaryColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  controller.signup.value = false;
                                },
                                child: Container(
                                  width: screenWidth * 0.4,
                                  color: Colors.white,
                                  child: Stack(
                                    children: [
                                      Container(
                                        height: screenHeight * 0.1,
                                        width: screenWidth * 0.4,
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Obx(
                                          () => Text(
                                            "Login".tr,
                                            style: TextStyle(
                                              color: controller.signup.value
                                                  ? Get.theme.primaryColor
                                                      .withOpacity(0.5)
                                                  : Get.theme.primaryColor,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Obx(
                                          () => Visibility(
                                            visible: controller.signup.value
                                                ? false
                                                : true,
                                            child: Container(
                                              height: 2,
                                              width: screenWidth * 0.25,
                                              color: Get.theme.primaryColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Obx(
                          () => controller.signup.value
                              ? SignupFormView()
                              : LoginFormView(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // alignment: Alignment.bottomCenter,
              top: screenHeight * 0.9,
              right: screenWidth * 0.1,
              left: screenWidth * 0.1,
              child: Padding(
                padding: EdgeInsets.only(bottom: screenHeight * 0.025),
                child: Container(
                  height: screenHeight * 0.1,
                  width: screenWidth * 0.8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SocialMediaCard(asset: "assets/images/icons/G_Logo.svg"),
                      SocialMediaCard(
                          asset: "assets/images/icons/twitterLogo.svg"),
                      SocialMediaCard(asset: "assets/images/icons/fbLogo.svg"),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
