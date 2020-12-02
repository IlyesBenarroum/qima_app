import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:qima/app/models/user_model.dart';
import 'package:qima/app/modules/home/home_view.dart';
import 'package:qima/app/modules/main/main_view.dart';
import 'package:qima/app/modules/splash/splash_view.dart';
import 'package:qima/app/tools/tools.dart';
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
User user = User();
GetStorage obs = GetStorage();
var accsT;

GraphQLClient _client = clientToQuery();
String tocken;
_loginWithFB() async {
  final result = await facebookLogin.logIn(['email']);

  switch (result.status) {
    case FacebookLoginStatus.loggedIn:
      Get.off(HomeView());
      final token = result.accessToken.token;
      final graphResponse = await http.get(
          'https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=$token');
      print("ja mal fc");
      final profile = JSON.jsonDecode(graphResponse.body);
      print(result);
      userProfile = profile;
      user.name = userProfile["name"];
      print('Token withe FaceBook  ' + token);
      print('Name withe FaceBook  ' + userProfile["name"]);
      signin(user.name, token);
      isLoggedIn = true;

      break;

    case FacebookLoginStatus.cancelledByUser:
      isLoggedIn = false;
      break;
    case FacebookLoginStatus.error:
      isLoggedIn = false;
      break;
  }
}

void signin(String fullName, String accessToken) async {
  print("Sign In TEst");
  print(fullName);
  print(accessToken);

  QueryResult result = await _client.mutate(MutationOptions(
    documentNode: gql("""
 mutation{
  loginWithFacebook(args:{
    fullName:"$fullName",
    accessToken:"$accessToken"
  }){
    accessToken
    me{
    	id
      fullName
      email
    }
  }
}
  """),
    onCompleted: (data) {
      print('Token with Api' + data.data["loginWithFacebook"]["accessToken"]);
      accsT = data.data["loginWithFacebook"]["accessToken"].toString();
      obs.write('SignUp', accsT);
      user.id = data.data["loginWithFacebook"]["me"]["id"];
      user.name = data.data["loginWithFacebook"]["me"]["fullName"];
      user.email = data.data["loginWithFacebook"]["me"]["email"];

      obs.write('SignUp', accsT);
      print('A');
      obs.write('id', user.id);
      print('B ID======' + user.id);
      print('B');
      obs.write('fullName', user.name);
      obs.write('email', user.email);
      print('completed');
      Get.off(SplashView());
    },
  ));
  if (!result.hasException) {
    print(result.data.data);
  } else {
    print(result.exception);
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
                    // controller.handelSignIn();

                    Get.off(HomeView());
                    _loginWithFB();
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
