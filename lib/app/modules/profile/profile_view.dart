import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../.././app/modules/auction_live/auction_live_view.dart';
import '../../.././app/modules/detail/detail2_view.dart';
import '../../.././app/modules/profile/profile_controller.dart';
import '../../.././app/modules/profile/views/edit_profile_view.dart';
import '../../.././app/widgets/notfoundwidget.dart';

import 'views/pastauctions.dart';

// var edit = false.obs;

ProfileController controller = Get.put(ProfileController());

class ProfileView extends GetView<ProfileController> {
  final List pastAuctionList = [1];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: Get.height,
            width: Get.width,
            color: Colors.transparent,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: Get.width,
              height: Get.height * .35,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0, 2),
                  )
                ],
                color: Colors.blueGrey,
              ),
              child: Padding(
                padding: EdgeInsets.only(top: Get.height * 0.05),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: Get.width * 0.3,
                      height: Get.width * 0.3,
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: new NetworkImage(
                            "https://upload.wikimedia.org/wikipedia/commons/2/28/Sillitoe-black-white.gif",
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'Abu_Bakr_Muhammad'.tr,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: Get.height * 0.31,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Text(
                Get.locale.languageCode == "en"
                    ? "+249912300000"
                    : "249912300000+",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            top: Get.height * 0.32,
            left: Get.locale.languageCode == "en"
                ? Get.width * 0.8
                : Get.width * 0.05,
            right: Get.locale.languageCode == "en"
                ? Get.width * 0.05
                : Get.width * 0.8,
            child: Container(
              width: Get.width * 0.12,
              height: Get.width * 0.12,
              child: IconButton(
                onPressed: () {
                  //
                  controller.edit.value = !controller.edit.value;
                },
                icon: Icon(
                  Icons.edit,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              decoration: new BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 1,
                    offset: Offset(0, 2),
                  )
                ],
                color: Get.theme.primaryColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: Get.height * 0.4,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              child: Text(
                "Previous_auctions".tr,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            top: Get.height * 0.39,
            child: pastAuctionList.length == 0
                ? Container(
                    height: screenHeight / 2,
                    width: screenWidth,
                    child: NotFoundWidget(
                        title: "Looks_like_you_have_not_created_an_auction_yet"
                            .tr),
                  )
                : GestureDetector(
                    onTap: () => Get.to(Detail2View()),
                    child: Container(
                      height: Get.height * 0.6,
                      width: Get.width,
                      child: Obx(
                        () => controller.edit.value
                            ? EditProfileView()
                            : PastauctionsView(
                                pastAuctionList: pastAuctionList,
                              ),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
