import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:qima/app/controllers/auction_controller.dart';
import 'package:qima/app/modules/add_auction/widgets/add_auction_info.dart';
import 'package:qima/app/modules/add_auction/widgets/add_auction_timing.dart';
import 'package:qima/app/modules/add_auction/widgets/country_cutumDropDown.dart';
import 'package:qima/app/modules/home/home_view.dart';
import 'package:qima/app/modules/splash/splash_controller.dart';

import '../../../../gloabals.dart';
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
  final AuctionController auctionController = Get.put(AuctionController());
  // final AuctionsController auctionsController = Get.put(AuctionsController());
  final _formKey = Globals.formKeys[1];
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
          child: Form(
            key: _formKey,
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
                      height: screenHeight * 0.41,
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
                                auctionController
                                    .setAuctionDate("${date.toUtc()}");
                                // print
                                // print(auctionController
                                // .auction.value.auctionDate);
                                // auctionController.setAuctionDate(
                                // "${date.year.toString()}/" +
                                // "${date.month.toString()}/" +
                                // "${date.day.toString()}");
                                print(auctionController.auctionDate);
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
                                  auctionController
                                      .setAuctionTiming("${time.toUtc()}");
                                  // print(auctionController
                                  //     .auction.value.auctionTiming
                                  //     .substring(10));
                                  print(auctionController
                                      .auction.value.auctionDate);
                                  //     .substring(0, 10));
                                  // print(Globals.auctionDate);
                                },
                                currentTime: DateTime.now(),
                                locale: lang == "ar"
                                    ? LocaleType.ar
                                    : LocaleType.en,
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
                                        lang == "ar"
                                            ? " ${controller.pickedTime.value.minute} " +
                                                ": ${controller.pickedTime.value.hour} "
                                            : " ${controller.pickedTime.value.hour} " +
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      controller.minusAuctionPeriod(-5);

                                      auctionController.setAuctionPeriod(
                                          "${controller.auctionPeriod.value}");
                                      // auctionController.setAuctionPeriod(
                                      // controller.auctionPeriod.value
                                      // .toString());
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
                                      auctionController.setAuctionPeriod(
                                          "${controller.auctionPeriod.value}");
                                      // controller.auctionPeriod.value
                                      // .toString());
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
                                        height: screenHeight * 0.11,
                                        width: screenWidth * 0.3,
                                        child: TextFormField(
                                          validator: (value) {
                                            if (!GetUtils.isNum(value)) {
                                              // controller.numberVisibility.value =
                                              //     false;
                                              return 'Enter_a_valid_amount'.tr;
                                            } else {
                                              // controller.numberVisibility.value =
                                              //     true;
                                              return null;
                                            }
                                          },
                                          // onSaved: (String val) {},
                                          // initialValue: "",
                                          onFieldSubmitted: (String val) {
                                            auctionController
                                                .setEntryPrice(val);
                                          },
                                          onChanged: (String val) {
                                            auctionController
                                                .setEntryPrice(val);
                                          },
                                          controller:
                                              controller.auctionEntryPrice
                                                ..text = "100",
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
                                            hintText: "100" + "Pound".tr,
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
                        Globals.auctionDate =
                            "${auctionController.auction.value.auctionDate.substring(0, 10)}${auctionController.auction.value.auctionTiming.substring(10)}";

                        if (_formKey.currentState.validate()) {
                          if (GetUtils.isNullOrBlank(
                              auctionController.entryPrice))
                            auctionController.setEntryPrice("30");

                          if (GetUtils.isNullOrBlank(
                              auctionController.auctionPeriod))
                            auctionController.setAuctionPeriod(
                                "${controller.auctionPeriod.value}");

                          print("tapped");
                          print("auctionController.auctionDate");
                          print(Globals.auctionDate);
                          // print(auctionController.auctionDate);
                          print("auctionController.auctionTiming");
                          print(auctionController.auctionTiming);
                          print("auctionController.auctionPeriod");
                          print(auctionController.auctionPeriod);
                          print("auctionController.entryPrice");
                          print(auctionController.entryPrice);
                          print("auctionController.country");
                          print(auctionController.country);
                          print("auctionController.serviceProvider");
                          print(auctionController.serviceProvider);
                          print("auctionController.specialNumber");
                          print(auctionController.specialNumber);
                          print("auctionController.condition");
                          print(auctionController.condition);
                          print("auctionController.subscription");
                          print(auctionController.subscription);
                          print(auctionController.arrearsValue);
                          print("auctionController.arrearsValue");

                          if (GetUtils.isNullOrBlank(userS.id)) {
                            print("Login");
                            Get.to(NewAuction3View());
                          } else {
                            // print("Signup");
                            // print(userS.id);
                            auctionController
                                .addAuction(auctionController.auction.value);
                            Get.to(HomeView());
                          }
                        }
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
      ),
    );
  }
}
