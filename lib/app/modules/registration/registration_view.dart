import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:qima/app/modules/home/home_view.dart';
import 'package:qima/app/modules/main/main_view.dart';
import 'registration_controller.dart';
import 'views/login_form_view.dart';

import 'views/signup_form_view.dart';
import 'widgets/socialmedia_card.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;

double screenHeight = Get.height;
double screenWidth = Get.width;

bool isLoggedIn = false;

Map userProfile;
final facebookLogin = FacebookLogin();

_loginWithFB() async {
  final result = await facebookLogin.logIn(['email']);

  switch (result.status) {
    case FacebookLoginStatus.loggedIn:
      Get.off(HomeView());
      final token = result.accessToken.token;
      final graphResponse = await http.get(
          'https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=$token');
      final profile = JSON.jsonDecode(graphResponse.body);
      print(result);
      userProfile = profile;
// <<<<<<< Updated upstream
      // _isLoggedIn = true;
      // Get.off(HomeView());

// =======
      isLoggedIn = true;
// >>>>>>> Stashed changes
      break;

    case FacebookLoginStatus.cancelledByUser:
      isLoggedIn = false;
      break;
    case FacebookLoginStatus.error:
      isLoggedIn = false;
      break;
  }
}

class RegistrationView extends GetView<RegistrationController> {
  final RegistrationController controller = Get.put(RegistrationController());
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
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding:
                            EdgeInsets.only(top: screenHeight * 0.68 * 0.25),
                        child: SvgPicture.asset(
                          "assets/images/logoNew.svg",
                          color: Colors.white,
                          height: screenHeight * 0.15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              // alignment: Alignment.bottomCenter,
              bottom: screenHeight * 0.09,
              left: screenWidth * 0.05,
              right: screenWidth * 0.05,
              child: Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.06),
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Obx(
                    () => Container(
                      height: controller.signup.value
                          ? screenHeight * 0.84
                          : screenHeight * 0.51,
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
                                    // height: screenHeight * 0.5,
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
            ),
            Positioned(
              // alignment: Alignment.bottomCenter,
              top: screenHeight * 0.9,
              right: screenWidth * 0.1,
              left: screenWidth * 0.1,
              child: Padding(
                padding: EdgeInsets.only(bottom: screenHeight * 0.025),
                child: GestureDetector(
                  onTap: () {
                    _loginWithFB();
                    Get.off(HomeView());
                  },
                  child: Container(
                    height: screenHeight * 0.1,
                    width: screenWidth * 0.8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SocialMediaCard(
                            asset: "assets/images/icons/G_Logo.svg"),
                        SocialMediaCard(
                            asset: "assets/images/icons/twitterLogo.svg"),
                        SocialMediaCard(
                            asset: "assets/images/icons/fbLogo.svg"),
                      ],
                    ),
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
