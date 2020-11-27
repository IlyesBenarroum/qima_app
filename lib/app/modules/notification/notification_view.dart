import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/modules/auction_live/auction_live_view.dart';
import '../../../app/widgets/customappbar.dart';
import '../../../app/widgets/notfoundwidget.dart';

import 'notification_controller.dart';
import 'views/notification_card_view.dart';

class NotificationView extends GetView<NotificationController> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = Get.height;
    double screenWidth = Get.width;
    List auctionList = [1];
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight * 0.1),
        child: CustomAppBar(
          title: 'Notifications'.tr,
          screenHeight: screenHeight,
          screenWidth: screenWidth,
        ),
      ),
      body: auctionList.length == 0
          ? NotFoundWidget(title: 'There_are_no_notifications'.tr)
          : Padding(
              padding: EdgeInsets.only(
                top: 10,
              ),
              child: Column(
                children: [
                  Flexible(
                    child: ListView.builder(
                      itemCount: 7,
                      itemBuilder: (context, index) => AuctionNotificationCard(
                        title:
                            "The_auction_has_started_You_can_access_the_room_now"
                                .tr,
                        phone: "0912300000",
                        time: "Now".tr,
                        icon:
                            "https://upload.wikimedia.org/wikipedia/commons/2/28/Sillitoe-black-white.gif",
                        screenHeight: screenHeight,
                        screenWidth: screenWidth,
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

class AuctionNotificationCard extends StatelessWidget {
  const AuctionNotificationCard({
    @required this.screenHeight,
    @required this.title,
    @required this.time,
    @required this.icon,
    @required this.phone,
    @required this.screenWidth,
    Key key,
  }) : super(key: key);
  final double screenHeight;
  final double screenWidth;
  final String icon;
  final String title;
  final String phone;
  final String time;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.grey[200],
          height: 1,
          width: screenWidth,
        ),
        GestureDetector(
          onTap: () => Get.to(
            AuctionLiveView(),
          ),
          child: NotificationCardView(
            screenHeight: screenHeight,
            screenWidth: screenWidth,
            icon: icon,
            time: time,
            phone: phone,
            title: title,
          ),
        ),
      ],
    );
  }
}
