import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../tools/constants.dart';

Widget numberTextFieldUI(
  String title,
  var validator,
  var controller,
  var keyboardType,
  double width,
  double height,
  var formKey,
  var inputVisibility,
  String inputText,
  String hintText,
  Function onSaved,
) {
  var lang = Get.locale.languageCode;

  return Container(
    height: height,
    width: width,
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Stack(
          children: [
            Positioned(
              right: lang == "ar" ? 8 : null,
              left: lang == "en" ? 8 : null,
              child: Obx(
                () => Visibility(
                  visible: inputVisibility.value,
                  child: Text(
                    title,
                    style: Constants.kAddingAuctionCardTitleTextStyle,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: TextFormField(
                validator: validator,
                onSaved: onSaved,
                controller: controller,
                keyboardType: keyboardType,
                maxLines: 1,
                onChanged: (String txt) {
                  inputText = controller.text;
                },
                cursorColor: Get.theme.primaryColor,
                textAlignVertical: TextAlignVertical.bottom,
                style: Constants.kAddAuctionNumberTextFeildTextStyle,
                decoration: new InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                  ),
                  errorText: null,
                  hintText: hintText,
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.withOpacity(1),
                  ),
                  errorStyle: TextStyle(
                    fontSize: 10,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
