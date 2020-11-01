import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../app/modules/add_auction/widgets/add_auction_drop_down_card_view.dart';
import '../../../../app/modules/add_auction/widgets/factureUI.dart';
import '../../../../app/modules/add_auction/widgets/number_text_feildUi.dart';
import '../widgets/usedUI.dart';
import '../add_auction_controller.dart';
import '../widgets/custom_adding_auction_app_bar.dart';
import '../widgets/empty_circle_container.dart';
import 'new_auction2_view.dart';
import '../widgets/white_circle_container.dart';

double screenHeight = Get.height;
double screenWidth = Get.width;

Widget _selectedImage;
String _selectedCountry;
String _selectedProvider;

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
  final _formKey = GlobalKey<FormState>();
  final AddAuctionController controller = Get.put(AddAuctionController());
  @override
  Widget build(BuildContext context) {
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
                            AddAuctionDropDownCardView(
                              title: "Country".tr,
                              child: GetBuilder<AddAuctionController>(
                                id: "country",
                                init: controller,
                                builder: (_) => Container(
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      items:
                                          _.countryData.keys.map((String val) {
                                        return DropdownMenuItem<String>(
                                          value: val,
                                          child: Stack(
                                            children: [
                                              Row(
                                                children: <Widget>[
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10.0),
                                                    child: _.countryData[val],
                                                  ),
                                                  Container(
                                                    width: screenWidth * 0.2,
                                                    child: FittedBox(
                                                      fit: BoxFit.scaleDown,
                                                      child: Text(val),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        );
                                      }).toList(),
                                      hint: Row(
                                        children: <Widget>[
                                          Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 12.0),
                                              child: _selectedImage ??
                                                  _.countryData.values
                                                      .toList()[0]),
                                          Container(
                                            width: screenWidth * 0.16,
                                            child: FittedBox(
                                              fit: BoxFit.scaleDown,
                                              child: Text(
                                                _selectedCountry ??
                                                    _.countryData.keys
                                                        .toList()[0],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      onChanged: (String val) {
                                        _selectedCountry = val;
                                        _selectedImage = _.countryData[val];
                                        controller.onInit();
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            AddAuctionDropDownCardView(
                              title: "Service_provider".tr,
                              child: GetBuilder<AddAuctionController>(
                                id: "service_providers",
                                init: controller,
                                builder: (_) => Container(
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      items: _.serviceProviderData
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
                                        child: Text(_selectedProvider ??
                                            _.serviceProviderData[0]),
                                      ),
                                      onChanged: (String val) {
                                        _selectedProvider = val;
                                        controller.onInit();
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
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
                            phone = val;
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
                          visible: !controller.isFactured.value &
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

      Get.to(NewAuction2View());
    } else {
      autoValidate.value = false;
    }
  }
}
