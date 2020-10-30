import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:qima/app/modules/add_auction/widgets/add_auction_info.dart';
import 'package:qima/app/modules/add_auction/widgets/add_auction_timing.dart';

import '../../../tools/constants.dart';
import '../add_auction_controller.dart';
import '../widgets/custom_adding_auction_app_bar.dart';
import '../widgets/empty_circle_container.dart';
import '../views/new_auction3_view.dart';
import '../widgets/white_circle_container.dart';

class NewAuction2View extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create_new_offer'.tr),
        elevation: 0,
        centerTitle: true,
      ),
      body: NewAuction2BodyView(),
    );
  }
}

class NewAuction2BodyView extends StatelessWidget {
  final AddAuctionController controller = Get.put(AddAuctionController());
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    DateTime minDate = DateTime(
      now.year,
      now.month,
      now.day + 2,
    );
    DateTime maxDate = DateTime(
      now.year + 1,
      now.month,
      now.day + 2,
    );
    double screenHeight = Get.height;
    double screenWidth = Get.width;
    var lang = Get.locale.languageCode;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(screenWidth, screenHeight * 0.11),
        child: CustomAddingAuctionAppbar(
          child1: WhiteCircleContainer(),
          child2: WhiteCircleContainer(),
          child3: EmptyCircleContainer(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.05),
        child: SingleChildScrollView(
          child: Container(
            height: screenHeight * 0.7,
            width: screenWidth,
            child: Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.025),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: screenHeight * 0.35,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            DatePicker.showDatePicker(context,
                                showTitleActions: true,
                                minTime: minDate,
                                maxTime: maxDate, onChanged: (date) {
                              controller.pickedDate.value = date;
                            }, onConfirm: (date) {
                              controller.pickedDate.value = date;
                            },
                                currentTime: minDate,
                                locale: lang == "ar"
                                    ? LocaleType.ar
                                    : LocaleType.en);
                          },
                          child: AddAuctionInfo(
                            title: "Auction_date".tr,
                            child: Padding(
                              padding: EdgeInsets.all(screenWidth * 0.02),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Obx(
                                    () => Text(
                                        "${controller.pickedDate.value.day}-${controller.pickedDate.value.month}-${controller.pickedDate.value.year}"),
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.025,
                                  ),
                                  SvgPicture.asset(
                                    "assets/images/icons/calendarIcon.svg",
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            DatePicker.showTimePicker(
                              context,
                              showTitleActions: true,
                              showSecondsColumn: false,
                              onConfirm: (time) {
                                controller.pickedTime.value = time;
                              },
                              currentTime: DateTime.now(),
                              locale:
                                  lang == "ar" ? LocaleType.ar : LocaleType.en,
                            );
                          },
                          child: AddAuctionInfo(
                            title: "Auction_Timing".tr,
                            child: Padding(
                              padding: EdgeInsets.all(screenWidth * 0.02),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Obx(
                                    () => Text(
                                      lang=="ar"?
                                      " ${controller.pickedTime.value.minute} " +
                                          ": ${controller.pickedTime.value.hour} ":" ${controller.pickedTime.value.hour} " +
                                          ": ${controller.pickedTime.value.minute} ",
                                    ),
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.03,
                                  ),
                                  SvgPicture.asset(
                                      "assets/images/icons/clock.svg"),
                                ],
                              ),
                            ),
                          ),
                        ),
                        AddAuctionTiming(
                          title: "Auction_period".tr,
                          child: Padding(
                            padding: EdgeInsets.all(screenWidth * 0.02),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    controller.minusAuctionPeriod(-5);
                                  },
                                  child: Icon(
                                    Icons.remove,
                                    color: Get.theme.primaryColor,
                                  ),
                                ),
                                Obx(
                                  () => Text(
                                    "${controller.auctionPeriod}",
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    controller.addAuctionPeriod(5);
                                  },
                                  child: Icon(
                                    Icons.add,
                                    color: Get.theme.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        AddAuctionInfo(
                          title: "Auction_entry_price".tr,
                          child: Padding(
                            padding: EdgeInsets.all(screenWidth * 0.02),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: lang == "en"
                                      ? Alignment.centerRight
                                      : Alignment.centerLeft,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: screenWidth * 0.02),
                                    child: Container(
                                      height: screenHeight * 0.075,
                                      width: screenWidth * 0.3,
                                      child: TextField(
                                        controller:
                                            controller.auctionEntryPrice,
                                        keyboardType: TextInputType.number,
                                        maxLines: 1,
                                        cursorColor: Get.theme.primaryColor,
                                        textAlignVertical:
                                            TextAlignVertical.bottom,
                                        style: Constants
                                            .kAddAuctionNumberTextFeildTextStyle,
                                        decoration: new InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                          ),
                                          hintText: "000" + "Pound".tr,
                                          hintStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey.withOpacity(1),
                                          ),
                                          errorStyle: TextStyle(
                                            fontSize: 7,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: lang == "en"
                                      ? Alignment.centerRight
                                      : Alignment.centerLeft,
                                  child: SvgPicture.asset(
                                      'assets/images/icons/dollarIcon.svg'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(NewAuction3View());
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 5,
                      color: Get.theme.primaryColor,
                      child: Container(
                        height: screenHeight * 0.08,
                        width: screenWidth * 0.9,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Next'.tr,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
