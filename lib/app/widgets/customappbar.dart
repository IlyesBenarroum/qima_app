import 'package:flutter/material.dart';

import '../../constants.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key key,
    this.action,
    this.leading,
    @required this.title,
    @required this.screenHeight,
    @required this.screenWidth,
  }) : super(key: key);
  final Widget action;
  final Widget leading;
  final String title;
  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: Padding(
        padding: EdgeInsets.only(top: screenHeight * 0.03),
        child: leading,
      ),
      actions: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.03,
              vertical: screenHeight * 0.03,
            ),
            child: action,
          ),
        ),
      ],
      flexibleSpace: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.only(
            bottom: screenHeight * 0.0225,
          ),
          child: Text(
            title,
            style: Constants.kAppBarTextStyle,
          ),
        ),
      ),
      centerTitle: true,
    );
  }
}
