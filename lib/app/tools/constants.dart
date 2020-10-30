import 'package:flutter/material.dart';

class Constants {
  //BottomNavigationBar
  static TextStyle kBottomNavigationBarTextStyle = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 10,
    color: Color(0xff8a959e).withOpacity(0.50),
  );
  static Color kBottomNavigationBarSelectedItemColor = const Color(0xff1d82ba);
  static Color kBottomNavigationBarUnselectedItemColor =
      Color(0xff8a959e).withOpacity(0.50);
  static Color kBottomNavigationBarBackgroundColor = const Color(0xFFFFFFFF);

  //CustomAppBar
  static TextStyle kAppBarTextStyle = const TextStyle(
    fontSize: 18,
    color: const Color(0xffffffff),
    fontWeight: FontWeight.w500,
  );

  //AuctionCustomAppbar
  static Color kunselectedLabelColor = const Color(0xFFFFFFFF);
  static Color klabelColor = Colors.amber;
  static Color kindicatorColor = const Color(0xFFFFFFFF);
  static TextStyle kunselectedLabelStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: Color(0xfffefeff).withOpacity(0.40),
  );
  static TextStyle klabelStyle = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w700,
    color: Color(0xfffefeff),
  );
  //auctioncard.auctioninfo
  static TextStyle kAuctionInfoTitleTextStyle = TextStyle(
    color: Color(
      0xff1d82ba,
    ),
    fontWeight: FontWeight.bold,
  );
  static TextStyle kAuctionInfoSubtitleTextStyle = TextStyle(
    fontWeight: FontWeight.w700,
    color: Color(0xff8a959e).withOpacity(0.50),
  );

  //notification screen
  static TextStyle kNotificationTextStyle = TextStyle(
    color: Colors.grey[700],
  );
  //live auction view card
  static TextStyle kLiveAuctionCardNameTextStyle = TextStyle(
    color: Color(0xff1e1d22),
    fontWeight: FontWeight.w700,
  );
  static TextStyle kLiveAuctionCardTimeTextStyle = TextStyle(
    fontWeight: FontWeight.w500,
    color: Color(0xff92a0ad),
  );
  static TextStyle kAddingAuctionCardTitleTextStyle = TextStyle(
    color: Colors.grey,
  );
  static TextStyle kAddAuctionNumberTextFeildTextStyle = TextStyle(
    fontWeight: FontWeight.w700,
    color: Color(0xff878787),
  );
  static TextStyle kAddAuctionDateTestStyle = TextStyle(
    fontWeight: FontWeight.w200,
    color: Color(0xff92a0ad),
  );
}
