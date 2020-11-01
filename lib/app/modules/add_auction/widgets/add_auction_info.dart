import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAuctionInfo extends StatelessWidget {
  const AddAuctionInfo({
    @required this.title,
    @required this.child,
    Key key,
  }) : super(key: key);
  final String title;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    double screenHeight = Get.height;
    double screenWidth = Get.width;
    return Container(
      height: screenHeight * 0.11,
      width: screenWidth * 0.9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Container(
              height: screenHeight * 0.075,
              width: screenWidth * 0.5,
              child: child,
            ),
          )
        ],
      ),
    );
  }
}
