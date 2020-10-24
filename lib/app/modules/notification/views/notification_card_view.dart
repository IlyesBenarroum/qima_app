import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants.dart';

class NotificationCardView extends GetView {
  const NotificationCardView({
    Key key,
    @required this.screenHeight,
    @required this.screenWidth,
    @required this.icon,
    @required this.time,
    @required this.phone,
    @required this.title,
  }) : super(key: key);

  final double screenHeight;
  final double screenWidth;
  final String icon;
  final String time;
  final String phone;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.147,
      //95
      width: screenWidth * 0.9,
      child: Row(
        children: [
          Container(
            height: screenWidth * 0.1,
            width: screenWidth * 0.1,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey[200],
              ),
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                  icon,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.1,
              vertical: screenWidth * 0.04,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //time and arrow
                Row(
                  children: [
                    Container(
                      width: screenWidth * 0.06,
                      height: screenHeight * 0.02,
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: Text(
                          time,
                          style: Constants.kNotificationTextStyle,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      size: screenWidth * 0.04,
                    )
                  ],
                ),
                Container(
                  width: screenWidth * 0.25,
                  height: screenHeight * 0.03,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Text(
                      phone,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: screenWidth * 0.6,
                  height: screenHeight * 0.02,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Text(
                      title,
                      style: Constants.kNotificationTextStyle,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
