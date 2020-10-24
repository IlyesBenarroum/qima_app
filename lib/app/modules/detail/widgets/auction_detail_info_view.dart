import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../app/modules/auction_live/widgets/auction_room_card_view.dart';

class AuctionDetailInfoView extends GetView {
  const AuctionDetailInfoView({
    Key key,
    @required this.title,
    @required this.info,
    @required this.icon,
    @required this.screenHeight,
  }) : super(key: key);

  final double screenHeight;
  final String title;
  final String icon;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.08,
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.05),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: screenHeight * 0.08,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  "$title",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              height: screenHeight * 0.08,
              child: Row(
                children: [
                  Container(
                    height: screenHeight * 0.08,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "$info",
                        style: TextStyle(
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: screenHeight * 0.01,
                  ),
                  SvgPicture.asset(
                    icon,
                    // height: screenHeight * 0.0225,
                    // width: screenHeight * 0.0225,
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
