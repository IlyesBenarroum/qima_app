import 'package:flutter/material.dart';

import '../tools/constants.dart';

class AuctionCustomAppbar extends StatelessWidget {
  const AuctionCustomAppbar({
    Key key,
    @required this.title,
    @required this.first,
    @required this.second,
    @required this.third,
    @required this.screenHeight,
  }) : super(key: key);

  final double screenHeight;
  final String title;
  final String first;
  final String second;
  final String third;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false, //
      flexibleSpace: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.only(bottom: screenHeight * 0.025),
          child: Text(
            '$title',
            style: Constants.kAppBarTextStyle,
          ),
        ),
      ),
      bottom: TabBar(
        tabs: [
          Tab(
            text: '$first',
          ),
          Tab(
            text: '$second',
          ),
          Tab(
            text: '$third',
          ),
        ],
        unselectedLabelColor: Constants.kunselectedLabelColor,
        labelColor: Constants.klabelColor,
        indicatorColor: Constants.kindicatorColor,
        indicatorSize: TabBarIndicatorSize.tab,
        unselectedLabelStyle: Constants.kunselectedLabelStyle,
        labelStyle: Constants.klabelStyle,
      ),
    );
  }
}
