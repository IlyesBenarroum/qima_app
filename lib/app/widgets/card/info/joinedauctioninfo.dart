import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../tools/constants.dart';

class JoinedAuctionInfo extends StatelessWidget {
  const JoinedAuctionInfo({
    Key key,
    @required this.number,
    @required this.screenWidth,
    @required this.asset,
    @required this.screenHeight,
    @required this.title,
  }) : super(key: key);

  final String number;
  final double screenWidth;
  final String asset;
  final double screenHeight;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.035),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.035,
              width: MediaQuery.of(context).size.width * 0.25,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Text(
                  number,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: screenWidth * 0.07,
            ),
            Container(
              width: screenWidth * 0.2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  asset != ""
                      ? SvgPicture.asset(
                          asset,
                          height: screenWidth * 0.05,
                        )
                      : Container(),
                  Container(
                    width: screenWidth * 0.15,
                    height: screenHeight * 0.0275,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        '$title',
                        style: Constants.kAuctionInfoTitleTextStyle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
