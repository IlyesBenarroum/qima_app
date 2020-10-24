import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants.dart';

class AddAuctionDropDownCardView extends GetView {
  AddAuctionDropDownCardView({
    Key key,
    @required this.title,
    @required this.child,
  }) : super(key: key);

  final double screenHeight = Get.height;
  final double screenWidth = Get.width;
  final Widget child;
  final String title;

  @override
  Widget build(BuildContext context) {
    var lang = Get.locale.languageCode;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Container(
            height: screenHeight * 0.1,
            width: screenWidth * 0.4,
            child: Stack(
              children: [
                Align(
                  alignment:
                      lang == "en" ? Alignment.topLeft : Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(
                      10,
                    ),
                    child: Text(
                      title,
                      style: Constants.kAddingAuctionCardTitleTextStyle,
                    ),
                  ),
                ),
                Align(
                  alignment: lang == "en"
                      ? Alignment.bottomLeft
                      : Alignment.bottomRight,
                  child: child,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
