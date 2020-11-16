import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../tools/constants.dart';
import 'info/auctioninfo.dart';
import 'info/interestedauctioninfo.dart';
import 'info/joinedauctioninfo.dart';

class AuctionCard extends StatelessWidget {
  const AuctionCard({
    @required this.type,
    @required this.icon,
    @required this.number,
    @required this.info,
    @required this.asset,
    @required this.asset2,
    @required this.title,
    @required this.title2,
    @required this.subtitle,
    @required this.subtitle2,
    @required this.screenHeight,
    @required this.screenWidth,
    Key key,
  }) : super(key: key);
  //type 0 for main and created auctions
  //type 1 for joined
  //type 2 intersted auction
  final int type;
  final String icon;
  final String number;
  final String info;
  final String asset;
  final String asset2;
  final String title;
  final String title2;
  final String subtitle;
  final String subtitle2;
  final double screenHeight;
  final double screenWidth;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: screenHeight * 0.025,
        vertical: screenHeight * 0.01,
      ),
      height: screenHeight * 0.175,
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.white70, width: 1),
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 10,
        shadowColor: Colors.grey[100],
        child: Padding(
          padding: EdgeInsets.all(screenHeight * 0.02),
          child: Row(
            children: [
              //image Container
              Container(
                height: screenHeight * 0.10,
                width: screenHeight * 0.10,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: icon,
                    placeholder: (context, url) =>
                        new CircularProgressIndicator(),
                    errorWidget: (context, url, error) => new Icon(Icons.error),
                    fit: BoxFit.fill,
                  ),

                  // child:Image(image: NetworkImageWithRetry(icon),),
                  //  Image.network(
                  //   icon,
                  //   fit: BoxFit.fill,
                  // ),
                ),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[300],
                      offset: Offset(0, 1),
                      blurRadius: 5,
                    ),
                  ],
                ),
              ),
              //info row & Column
              type == 0
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.025),
                          child: Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: FittedBox(
                                  fit: BoxFit.fill,
                                  child: Text(
                                    number,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.05,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.2,
                                child: info != ""
                                    ? FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          info,
                                          style: info == "In_Review".tr
                                              ? TextStyle(
                                                  color: Colors.orange,
                                                )
                                              : info == "Rejected".tr
                                                  ? TextStyle(
                                                      color: Colors.red,
                                                    )
                                                  : Constants
                                                      .kAuctionInfoTitleTextStyle,
                                        ),
                                      )
                                    : null,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.04),
                              child: CreatedAuctionInfo(
                                asset: asset,
                                title: title,
                                subtitle: subtitle,
                                screenHeight: screenHeight,
                                screenWidth: screenWidth,
                              ),
                            ),
                            SizedBox(
                              width: screenWidth * 0.07,
                            ),
                            CreatedAuctionInfo(
                              asset: asset2,
                              title: title2,
                              subtitle: subtitle2,
                              screenHeight: screenHeight,
                              screenWidth: screenWidth,
                            ),
                          ],
                        ),
                      ],
                    )
                  : type == 1
                      ? JoinedAuctionInfo(
                          number: number,
                          screenWidth: screenWidth,
                          asset: asset,
                          screenHeight: screenHeight,
                          title: title,
                        )
                      : InterestedAuctionInfo(
                          screenHeight: screenHeight,
                          number: number,
                          screenWidth: screenWidth,
                          asset: asset,
                          title: title,
                          asset2: asset2,
                          title2: title2,
                        ),
            ],
          ),
        ),
      ),
    );
  }
}
