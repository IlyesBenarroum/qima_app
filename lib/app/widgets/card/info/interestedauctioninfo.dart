import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants.dart';

class InterestedAuctionInfo extends StatelessWidget {
  const InterestedAuctionInfo({
    Key key,
    @required this.screenHeight,
    @required this.number,
    @required this.screenWidth,
    @required this.asset,
    @required this.title,
    @required this.asset2,
    @required this.title2,
  }) : super(key: key);

  final double screenHeight;
  final String number;
  final double screenWidth;
  final String asset;
  final String title;
  final String asset2;
  final String title2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: screenHeight * 0.035,
        left: screenWidth * 0.035,
        right: screenWidth * 0.035,
      ),
      child: Container(
        width: screenWidth * 0.51,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.03,
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
              height: screenHeight * 0.005,
            ),
            Container(
              width: screenWidth * 0.55,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        asset,
                        height: screenWidth * 0.055,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Container(
                          width: screenWidth * 0.14,
                          height: screenHeight * 0.0275,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              '$title',
                              style: Constants.kAuctionInfoTitleTextStyle,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        asset2,
                        height: screenWidth * 0.055,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Container(
                          width: screenWidth * 0.14,
                          height: screenHeight * 0.0275,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              '$title2',
                              style: Constants.kAuctionInfoTitleTextStyle,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
