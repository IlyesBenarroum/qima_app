import 'dart:async';
import 'dart:ui';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qima/app/controllers/auction_controller.dart';
import 'package:qima/app/models/auction_model.dart';
import '../../.././app/modules/auction_room/auction_live_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../.././app/modules/auction_room/widgets/auction_room_card_view.dart';
import '../../.././app/widgets/customappbar.dart';
import '../../tools/constants.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:share/share.dart';

final double screenHeight = Get.height;
final double screenWidth = Get.width;

String text = 'Qima';
String subject = 'Win Auction with friends';
int amount = 0;

class AuctionLiveView extends GetView<AuctionLiveController> {
  final AuctionController auctionController = Get.put(AuctionController());
  final AuctionLiveController auctionLiveController =
      Get.put(AuctionLiveController());
  AuctionLiveView({
    @required this.auction,
    Key key,
  }) : super(key: key);
  final Auction auction;
  final GlobalKey<AnimatedCircularChartState> _chartKey =
      new GlobalKey<AnimatedCircularChartState>();

  @override
  Widget build(BuildContext context) {
    var firstPrice = false.obs;
    var secondPrice = false.obs;
    var thirdPrice = false.obs;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight * 0.1),
        child: CustomAppBar(
          title: 'Auction_room'.tr,
          screenHeight: screenHeight,
          screenWidth: screenWidth,
          leading: null,
          action: IconButton(
            onPressed: () {
              Share.share(
                text,
                subject: subject,
                // sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
              );
            },
            tooltip: "Share with Friends",
            icon: Icon(
              Icons.share,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: screenHeight,
            width: screenWidth,
            color: Colors.transparent,
          ),
          //images

          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: screenHeight * .3,
              width: screenWidth,
              child: Image.network(
                "https://upload.wikimedia.org/wikipedia/commons/2/28/Sillitoe-black-white.gif",
                fit: BoxFit.fill,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 5,
                sigmaY: 5,
              ),
              child: Container(
                height: screenHeight * .3,
                width: screenWidth,
                color: Colors.black.withOpacity(0.4),
              ),
            ),
          ),

          //phone number
          Positioned(
            top: screenHeight * 0.05,
            left: screenWidth * 0.125,
            right: screenWidth * 0.125,
            child: Container(
              height: screenHeight * 0.1,
              width: screenWidth * 0.75,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  "${auction.getProduct.getSpecialNumber}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          //price card
          Positioned(
            top: screenHeight * 0.2,
            left: screenWidth * 0.05,
            right: screenWidth * 0.05,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 5,
              child: Container(
                height: screenHeight * 0.125,
                width: screenWidth * 0.9,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: screenWidth * 0.26,
                        height: screenHeight * 0.055,
                        child: StreamBuilder(
                          stream: controller.logStream,
                          builder: (context, snapshot) {
                            // if (snapshot.connectionState==ConnectionState.waiting)
                            if (snapshot.hasData) {
                              print(
                                  snapshot.data.data["subToEvents"]["payload"]);
                              return FittedBox(
                                //Sub
                                fit: BoxFit.fill,
                                child: Text(
                                  "${snapshot.data.data["subToEvents"]["payload"]["currentPrice"]} " +
                                      "Pound".tr,
                                  // style: TextSt/yle(
                                  // fontSize: 10,
                                  // ),
                                  style: Constants.kAuctionInfoTitleTextStyle,
                                ),
                              );
                            }

                            return FittedBox(
                              //Sub
                              fit: BoxFit.fill,
                              child: Text(
                                "${auction.getEntryPrice} " + "Pound".tr,
                                style: Constants.kAuctionInfoTitleTextStyle,
                              ),
                            );
                          },
                        ),
                      ),
                      Container(
                        width: screenWidth * 0.2,
                        height: screenHeight * 0.035,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            "Current_bid".tr,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          //top info
          Positioned(
            top: screenHeight * 0.35,
            left: screenWidth * 0.05,
            right: screenWidth * 0.05,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                //top of this list
                Row(
                  children: [
                    SvgPicture.asset("assets/images/icons/notifIcon.svg"),
                    Text(
                      "${auction.getJoiners}" + "Bidders".tr,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: screenHeight * 0.06,
                  width: screenHeight * 0.06,
                  child: Stack(
                    children: [
                      TimerWidget(chartKey: _chartKey, auction: auction),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned.fill(
            top: screenHeight * 0.425,
            child: Container(
              child: ListView.builder(
                itemCount: auction.joiners,
                itemBuilder: (context, index) => AuctionRoomCardView(
                  
                  joiners: auction.joiners,
                ),
              ),
            ),
          ),
          //bid
          Positioned(
            left: screenWidth * 0.05,
            right: screenWidth * 0.05,
            bottom: screenHeight * 0.025,
            child: InkWell(
              onTap: () {
                if (amount != 0)
                  auctionController.placeBid("$amount", auction.getId);
                amount = 0;
                firstPrice.value = false;
                secondPrice.value = false;
                thirdPrice.value = false;
              },
              child: Obx(
                () => AnimatedContainer(
                  duration: Duration(milliseconds: 0),
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * .9,
                  decoration: BoxDecoration(
                    color: firstPrice.value ||
                            secondPrice.value ||
                            thirdPrice.value
                        ? Get.theme.primaryColor
                        : Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0.00, 2.00),
                        color: Colors.white,
                        blurRadius: 4,
                      ),
                    ],
                    border: Border.all(
                      color: Get.theme.primaryColor,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10.00),
                  ),
                  child: Center(
                    child: Text(
                      "Bid_now".tr,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: firstPrice.value ||
                                secondPrice.value ||
                                thirdPrice.value
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          //bid price
          Positioned(
            bottom: MediaQuery.of(context).size.height * .125,
            left: screenWidth * .075,
            right: screenWidth * .075,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    // auctionController.placeBid("500", auction.getId);
                    amount = 500;
                    firstPrice.value = false;
                    secondPrice.value = false;
                    thirdPrice.value = true;
                  },
                  child: Obx(
                    () => Container(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.25,
                      decoration: BoxDecoration(
                        color: thirdPrice.value
                            ? Get.theme.primaryColor
                            : Color(0xffffffff),
                        border: Border.all(
                          width: 2.00,
                          color: Get.theme.primaryColor,
                        ),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0.00, 3.00),
                            color: Color(0xff000000).withOpacity(0.16),
                            blurRadius: 8,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(5.00),
                      ),
                      child: Center(
                        child: new Text(
                          "500",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color:
                                thirdPrice.value ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    // auctionController.placeBid(200, auction.getId);
                    amount = 200;

                    firstPrice.value = false;
                    secondPrice.value = true;
                    thirdPrice.value = false;
                  },
                  child: Obx(
                    () => new Container(
                      height: screenHeight * 0.06,
                      width: screenWidth * 0.25,
                      decoration: BoxDecoration(
                        color: secondPrice.value
                            ? Get.theme.primaryColor
                            : Color(0xffffffff),
                        border: Border.all(
                          width: 2.00,
                          color: Get.theme.primaryColor,
                        ),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0.00, 3.00),
                            color: Color(0xff000000).withOpacity(0.16),
                            blurRadius: 8,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(5.00),
                      ),
                      child: Center(
                        child: new Text(
                          "200",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color:
                                secondPrice.value ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    // auctionController.placeBid(100, auction.getId);
                    amount = 100;

                    firstPrice.value = true;
                    secondPrice.value = false;
                    thirdPrice.value = false;
                  },
                  child: Obx(
                    () => new Container(
                      height: screenHeight * 0.06,
                      width: screenWidth * 0.25,
                      decoration: BoxDecoration(
                        color: firstPrice.value
                            ? Get.theme.primaryColor
                            : Color(0xffffffff),
                        border: Border.all(
                          width: 2.00,
                          color: Get.theme.primaryColor,
                        ),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0.00, 3.00),
                            color: Color(0xff000000).withOpacity(0.16),
                            blurRadius: 8,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(5.00),
                      ),
                      child: Center(
                        child: new Text(
                          "100",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color:
                                firstPrice.value ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TimerWidget extends StatefulWidget {
  const TimerWidget({
    Key key,
    @required GlobalKey<AnimatedCircularChartState> chartKey,
    @required this.auction,
  })  : _chartKey = chartKey,
        super(key: key);

  final GlobalKey<AnimatedCircularChartState> _chartKey;
  final Auction auction;

  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  Timer _timer;
  int _start;
  void startTimer() {
    const oneMin = const Duration(minutes: 1);
    _timer = new Timer.periodic(
      oneMin,
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            timer.cancel();
          } else {
            setState(() {
              _start = _start - 1;
            });
          }
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _start = int.parse(widget.auction.auctionPeriod);
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(children: [
        Align(
          alignment: Alignment.center,
          child: CircularCountDownTimer(
            key: UniqueKey(),
            duration: int.parse(widget.auction.auctionPeriod) * 60,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.grey[300],
            fillColor: Colors.yellow[800],
            strokeWidth: 4.0,
            textStyle: TextStyle(
                fontSize: 0.0,
                color: Colors.black87,
                fontWeight: FontWeight.bold),
            isReverse: false,
            onComplete: () {
              print("complete");
              setState(() {
                //min--;
              });
            },
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Text("$_start"),
        ),
//           child: Timer(
//             (
//               Duration(minutes: int.parse(widget.auction.auctionPeriod),(){
// print('');
//               };
//               )
//               ),),

//         ),
      ]),
    );
    // AnimatedCircularChart(
    //   key: widget._chartKey,
    //   size: Size(screenHeight * 0.06, screenHeight * 0.06),
    //   initialChartData: <CircularStackEntry>[
    //     new CircularStackEntry(
    //       <CircularSegmentEntry>[
    //         new CircularSegmentEntry(
    //           90, // value of time to update
    //           Get.theme.primaryColor,
    //           rankKey: 'remaining',
    //         ),
    //       ],
    //       rankKey: 'progress',
    //     ),
    //   ],
    //   // holeLabel: "20د",
    //   holeLabel: "${widget.auction.auctionPeriod}",
    //   labelStyle: Constants.kAuctionInfoTitleTextStyle,
    //   chartType: CircularChartType.Radial,
    //   edgeStyle: SegmentEdgeStyle.round,
    //   percentageValues: true,
    // ),
    // );
  }
}
