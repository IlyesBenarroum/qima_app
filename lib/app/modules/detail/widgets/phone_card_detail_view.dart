import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'phone_Detail_info_view.dart';

class PhoneCardDetailView extends GetView {
  const PhoneCardDetailView({
    Key key,
    @required this.screenWidth,
    @required this.screenHeight,
    @required this.provider,
    @required this.number,
    @required this.condition,
    @required this.type,
    @required this.arrears,
    @required this.arrearsvalue,
  }) : super(key: key);

  final double screenWidth;
  final double screenHeight;
  final String provider;
  final String number;
  final String condition;
  final String type;
  final String arrears;
  final String arrearsvalue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 10,
        child: Container(
          width: screenWidth * 0.9,
          // height: screenHeight * .37,
          child: Column(
            children: [
              PhoneDetailInfoView(
                screenHeight: screenHeight,
                title: "Service_provider".tr,
                info: provider,
              ),
              Divider(
                color: Colors.grey[300],
              ),
              PhoneDetailInfoView(
                screenHeight: screenHeight,
                title: "Special_number".tr,
                info: number,
                //data to card detail
              ),
              Divider(
                color: Colors.grey[300],
              ),
              PhoneDetailInfoView(
                screenHeight: screenHeight,
                title: "Condition".tr,
                info: condition,
              ),
              Divider(
                color: Colors.grey[300],
              ),
              PhoneDetailInfoView(
                screenHeight: screenHeight,
                title: "Type".tr,
                info: type,
              ),
              Divider(
                color: Colors.grey[300],
              ),
              PhoneDetailInfoView(
                screenHeight: screenHeight,
                title: "Arrears".tr,
                info: arrears,
              ),
              Divider(
                color: Colors.grey[300],
              ),
              PhoneDetailInfoView(
                screenHeight: screenHeight,
                title: "Arrears_value".tr,
                info: arrearsvalue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
