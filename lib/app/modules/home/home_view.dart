import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qima/app/controllers/auction_controller.dart';
import '../../../app/modules/auctions/auction_view.dart';
import '../../../app/modules/main/main_view.dart';
import '../../../app/modules/notification/notification_view.dart';
import '../../../app/modules/profile/profile_view.dart';

import '../../tools/constants.dart';
import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('HomeView'),
      //   centerTitle: true,
      // ),
      body: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    MainView(),
    NotificationView(),
    AuctionView(),
    ProfileView(),
  ];
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final String auctionIcon = 'assets/images/icons/auctionIcon.svg';
  @override
  Widget build(BuildContext context) {
    AuctionController().onInit();
    double screenHeight = Get.height;
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: Container(
        height: screenHeight * 0.1,
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey[200],
              blurRadius: 5,
            ),
          ],
        ),
        child: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Main'.tr,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notifications'.tr,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Auctions'.tr,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile'.tr,
            ),
          ],
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Constants.kBottomNavigationBarSelectedItemColor,
          unselectedItemColor:
              Constants.kBottomNavigationBarUnselectedItemColor,
          backgroundColor: Constants.kBottomNavigationBarBackgroundColor,
          selectedLabelStyle: Constants.kBottomNavigationBarTextStyle,
          unselectedLabelStyle: Constants.kBottomNavigationBarTextStyle,
        ),
      ),
    );
  }
}
