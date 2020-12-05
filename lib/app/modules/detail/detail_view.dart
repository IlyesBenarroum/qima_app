import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qima/app/controllers/auction_controller.dart';
import 'package:qima/app/modules/registration/registration_view.dart';
import 'package:qima/app/modules/splash/splash_controller.dart';
import '../../../app/modules/detail/detail_controller.dart';
import '../../../app/tools/popUps.dart';
import '../../../app/widgets/customappbar.dart';
import 'widgets/auction_card_detail_view.dart';
import 'widgets/phone_card_detail_view.dart';
import 'package:share/share.dart';

String text = 'Qima';
String subject = 'Win Auction with friends';

class DetailView extends GetView<DetailController> {
  final int index;

  DetailView({this.index});
  final AuctionController auctionController = Get.put(AuctionController());

  @override
  Widget build(BuildContext context) {
    var auctionDetails = true.obs;
    var phoneDetails = true.obs;
    DetailController controller = Get.put(DetailController());

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight * 0.1),
        child: CustomAppBar(
          title: 'Informations_about_the_offer'.tr,
          screenHeight: screenHeight,
          screenWidth: screenWidth,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () => Get.back(),
          ),
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: screenHeight * .3,
              width: screenWidth,
              child: CachedNetworkImage(
                imageUrl:
                    "https://upload.wikimedia.org/wikipedia/commons/2/28/Sillitoe-black-white.gif",
                placeholder: (context, url) => new CircularProgressIndicator(),
                errorWidget: (context, url, error) => new Icon(Icons.error),
                fit: BoxFit.fill,
              ),
              // Image.network(
              //   "https://upload.wikimedia.org/wikipedia/commons/2/28/Sillitoe-black-white.gif",
              //   fit: BoxFit.fill,
              // ),
            ),
            GestureDetector(
              onTap: () {
                controller.toggleDetail(auctionDetails);
              },
              child: InkWell(
                child: Container(
                  width: screenWidth,
                  height: screenHeight * 0.08,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: screenHeight * 0.04,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Text(
                              "Auction_details".tr,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: screenHeight * 0.08,
                          child: Icon(
                            Icons.arrow_drop_down,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Obx(
              () => Visibility(
                visible: auctionDetails.value,
                child: AuctionCardDetailView(
                  date:
                      //  "0",
                      "${auctionController.auctionsList[index].getAuctionDate.substring(0, 10)}",
                  timing:
                      //  "0",
                      "${auctionController.auctionsList[index].getAuctionTiming.substring(11, 16)}",
                  duration:
                      //  "0",
                      "${auctionController.auctionsList[index].auctionPeriod.substring(0, 2)} " +
                          "Minutes".tr,
                  enteryprice:
                      "${auctionController.auctionsList[index].getEntryPrice} " +
                          "Pound".tr,
                  screenWidth: screenWidth,
                  screenHeight: screenHeight,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                controller.toggleDetail(phoneDetails);
              },
              child: InkWell(
                child: Container(
                  width: screenWidth,
                  height: screenHeight * 0.08,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: screenHeight * 0.04,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Text(
                              "Number_details".tr,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: screenHeight * 0.08,
                          child: Icon(
                            Icons.arrow_drop_down,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Obx(
              () => Visibility(
                visible: phoneDetails.value,
                child: PhoneCardDetailView(
                  provider:
                      // "0",
                      "${auctionController.auctionsList[index].getProduct.getServiceProvider}"
                          .tr,
                  number:
                      // "0",
                      "${auctionController.auctionsList[index].getProduct.getSpecialNumber}",
                  type:
                      "${auctionController.auctionsList[index].getProduct.getCondition}" ==
                              "NEW"
                          ? "New".tr
                          : "Used".tr,
                  condition:
                      "${auctionController.auctionsList[index].getProduct.getSubscription}",
                  arrears:
                      "${auctionController.auctionsList[index].getProduct.arrearsValue}" !=
                              "0"
                          ? "Exist".tr
                          : "Don't Exist".tr,
                  arrearsvalue: GetUtils.isNullOrBlank(auctionController
                          .auctionsList[index].getProduct.getArrearsValue)
                      ? "0 " + "Pound".tr
                      : "${auctionController.auctionsList[index].getProduct.getArrearsValue}" +
                          "Pound".tr,
                  screenWidth: screenWidth,
                  screenHeight: screenHeight,
                ),
              ),
            ),
            Obx(() {
              return Visibility(
                visible: auctionController.auctionsList[index].getCreatedBy !=
                    userS.id,
                child: Padding(
                  padding: EdgeInsets.all(screenWidth * 0.05),
                  child: Container(
                    width: screenWidth * 0.9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: screenHeight * 0.0875,
                          width: screenWidth * 0.425,
                          child: RaisedButton(
                            textColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            color: Color(0xff3686bd),
                            onPressed: () {
                              if (GetUtils.isNullOrBlank(userS.id)) {
                                Get.to(RegistrationView());
                              } else {
                                auctionController.joinAuction(
                                    auctionController.auctionsList[index].id);
                                joinAuction();
                              }
                            },
                            child: Text('Join'.tr),
                          ),
                        ),
                        Container(
                          height: screenHeight * 0.0875,
                          width: screenWidth * 0.425,
                          child: RaisedButton(
                            textColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            color: Color(0xffffe477),
                            onPressed: () {
                              if (GetUtils.isNullOrBlank(userS.id)) {
                                Get.to(RegistrationView());
                              } else {
                                auctionController.intrestAuction(
                                    auctionController.auctionsList[index].id);
                                addedToIntersted();
                              }
                            },
                            child: Text('Interest'.tr),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
