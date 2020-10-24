import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants.dart';

class CreatedAuctionInfo extends StatelessWidget {
  const CreatedAuctionInfo({
    Key key,
    @required this.asset,
    @required this.title,
    @required this.subtitle,
    @required this.screenHeight,
    @required this.screenWidth,
  }) : super(key: key);
  final String asset;
  final String title;
  final String subtitle;
  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        asset != ""
            ? SvgPicture.asset(
                asset,
                height: screenWidth * 0.055,
                width: screenWidth * 0.055,
              )
            : Container(),
        SizedBox(
          width: screenWidth * 0.02,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: screenWidth * 0.12,
              height: screenHeight * 0.0235,
              child: title != null
                  ? FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        '$title',
                        style: Constants.kAuctionInfoTitleTextStyle,
                      ),
                    )
                  : null,
            ),
            Container(
              height: screenWidth * 0.035,
              width: screenWidth * 0.1,
              child: subtitle != null
                  ? FittedBox(
                      fit: BoxFit.fill,
                      child: Text(
                        '$subtitle',
                        style: Constants.kAuctionInfoSubtitleTextStyle,
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ],
    );
  }
}
