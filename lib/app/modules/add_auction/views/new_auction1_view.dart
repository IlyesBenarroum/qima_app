import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:qima/app/controllers/auction_controller.dart';
import 'package:qima/app/controllers/provider_controller.dart';
import 'package:qima/app/models/auction_model.dart';
import 'package:qima/app/models/provider_model.dart';
import 'package:qima/app/modules/add_auction/widgets/country_cutumDropDown.dart';
import '../../../../app/modules/add_auction/widgets/add_auction_drop_down_card_view.dart';
import '../../../../app/modules/add_auction/widgets/factureUI.dart';
import '../../../../app/modules/add_auction/widgets/number_text_feildUi.dart';
import '../../../../gloabals.dart';
import '../widgets/usedUI.dart';
import '../add_auction_controller.dart';
import '../widgets/custom_adding_auction_app_bar.dart';
import '../widgets/empty_circle_container.dart';
import 'new_auction2_view.dart';
import '../widgets/white_circle_container.dart';

double screenHeight = Get.height;
double screenWidth = Get.width;

var selectedCountry = 0.obs;

String phone = '0';
String number = "0";

Pattern phonePattern = r"^(?:[+0]9)?[0-9]{10}$";
RegExp regex = RegExp(phonePattern);

String _selectedAnwser;

var autoValidate = false.obs;
DateTime now = DateTime.now();
DateTime minDate = DateTime(
  now.year,
  now.month,
  now.day + 1,
);
DateTime maxDate = DateTime(
  now.year + 1,
  now.month,
  now.day + 1,
);

class NewAuction1View extends GetView {
  // final _formKey = GlobalKey<FormState>();
  final _formKey = Globals.formKeys[0];
  final AddAuctionController controller = Get.put(AddAuctionController());
  final AuctionController auctionController = Get.put(AuctionController());
  final ProviderController providerController = Get.put(ProviderController());

  @override
  Widget build(BuildContext context) {
    // print(selectedCountry.value);
    return Scaffold(
      appBar: PreferredSize(
        child: CustomAddingAuctionAppbar(
          child1: WhiteCircleContainer(),
          child2: EmptyCircleContainer(),
          child3: EmptyCircleContainer(),
        ),
        preferredSize: Size(screenWidth, screenHeight * 0.11),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.05),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              height: screenHeight * 0.7,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: screenHeight * 0.005),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomDropDown(),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: screenHeight * 0.005),
                        child: numberTextFieldUI(
                          "Number".tr,
                          (value) {
                            if (!regex.hasMatch(value)) {
                              controller.numberVisibility.value = false;
                              return 'Enter_a_valid_phone_number'.tr;
                            } else {
                              controller.numberVisibility.value = true;
                              return null;
                            }
                          },
                          controller.phoneController,
                          TextInputType.phone,
                          screenWidth * 0.9,
                          screenHeight * 0.11,
                          _formKey,
                          controller.numberVisibility,
                          phone,
                          "0913000001",
                          (String val) {
                            // print(val);

                            // if (!GetUtils.isNullOrBlank(val))
                            //  auctionController.setS
                            // .setArrearsValue
                            auctionController.setSpecialNumber(val);
                            // .setSpecialNumber(val); // val;
                            //  Auction(
                            // product: Product(
                            // specialNumber: val,
                            // ));
                            phone = val;
                            // print(auctionController.phoneNumber);
                          },
                        ),
                      ),
                      usedUi(),
                      Obx(
                        () => Visibility(
                          visible: controller.isUsed.value,
                          child: factureUi(),
                        ),
                      ),
                      Obx(
                        () => Visibility(
                          visible: !controller.isPostPaid.value &
                              controller.isUsed.value,
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                AddAuctionDropDownCardView(
                                  title: "Arrears".tr,
                                  child: GetBuilder<AddAuctionController>(
                                    id: "arrears",
                                    init: controller,
                                    builder: (_) => Container(
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton<String>(
                                          items: _.arrears
                                              .map<DropdownMenuItem<String>>(
                                                  (String val) {
                                            return DropdownMenuItem<String>(
                                              value: val,
                                              child: FittedBox(
                                                fit: BoxFit.contain,
                                                child: Text(
                                                  val,
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                          hint: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Text(_selectedAnwser ??
                                                _.arrears[0]),
                                          ),
                                          onChanged: (String val) {
                                            val == _.arrears[1]
                                                ? controller.isArrears.value =
                                                    true
                                                : controller.isArrears.value =
                                                    false;
                                            _selectedAnwser = val;
                                            auctionController
                                                .setArrearsValue("0");
                                            // .arrearsValue = 0;

                                            // auctionController.setArrears(true);
                                            // auctionController
                                            //     .setArrearsValue("0");

                                            controller.onInit();
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Obx(
                                  () => Visibility(
                                    visible: controller.isArrears.value,
                                    child: numberTextFieldUI(
                                      "Arrears_value".tr,
                                      (value) {
                                        if (!GetUtils.isNum(value)) {
                                          controller.arrearsVisibility.value =
                                              false;
                                          return 'Enter_a_valid_amount'.tr;
                                        } else {
                                          controller.arrearsVisibility.value =
                                              true;

                                          auctionController
                                              .setArrearsValue(value);
                                          // .arrearsValue = value;
                                          // auctionController
                                          //     .setArrearsValue(value);

                                          return null;
                                        }
                                      },
                                      controller.arrearsController,
                                      TextInputType.number,
                                      screenWidth * 0.4,
                                      screenHeight * 0.11,
                                      _formKey,
                                      controller.arrearsVisibility,
                                      number,
                                      " 0 " + "Pound".tr,
                                      (String val) {
                                        number = val;
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      _validateInputs();
                      print(auctionController.country);
                      // if (GetUtils.isNullOrBlank(auctionController.country))
                      //   auctionController.setCountry(
                      //       controller.countryData.keys.toList()[0]);
                      // if (GetUtils.isNullOrBlank(auctionController.provider))
                      //   auctionController
                      //       .setProvider(controller.serviceProviderData[0]);
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 3,
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

  void _validateInputs() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      // _formKey.currentState.dispose();
      Get.to(NewAuction2View());
    } else {
      autoValidate.value = false;
    }
  }
}
