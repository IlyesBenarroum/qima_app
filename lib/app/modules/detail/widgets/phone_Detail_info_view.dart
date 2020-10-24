import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/modules/auction_live/widgets/auction_room_card_view.dart';

class PhoneDetailInfoView extends GetView {
  const PhoneDetailInfoView({
    Key key,
    @required this.title,
    @required this.info,
    @required this.screenHeight,
  }) : super(key: key);

  final double screenHeight;
  final String title;

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
                fit: BoxFit.fill,
                child: Text(
                  "$title",
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                    color: Colors.grey[700],
                  ),
                ),
              ),
            ),
            Container(
              height: screenHeight * 0.08,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Text(
                  "$info",
                  style: TextStyle(
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
