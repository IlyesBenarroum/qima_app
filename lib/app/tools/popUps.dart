import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../app/modules/auctions/auction_view.dart';
import '../../app/modules/home/home_view.dart';
import '../modules/registration/registration_view.dart';
import 'package:share/share.dart';

void showSuccessDialog(BuildContext context, String success) {
  showDialog(
    context: context,
    builder: (context) {
      return GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(color: Color(0xff5acfc3).withOpacity(.6)),
          child: GestureDetector(
            onTap: () => print(''),
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width * .9,
                  child: Material(
                    textStyle: TextStyle(color: Colors.black),
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                                onTap: () => Navigator.pop(context),
                                child: Icon(
                                  Icons.clear,
                                  color: Colors.grey,
                                )),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "Bravo !\n",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Gotham',
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        WidgetSpan(
                                          child: Container(
                                            height: 10.0,
                                          ),
                                        ),
                                        TextSpan(
                                            text:
                                                success.toUpperCase() + "\n\n",
                                            style: TextStyle(
                                                fontFamily: "Gotham",
                                                color: Color(0xff5acfc3),
                                                fontWeight: FontWeight.w300,
                                                fontSize: 12)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}

void showErrorDialog(BuildContext context, String error) {
  showDialog(
      context: context,
      builder: (context) {
        return GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(color: Color(0xff5acfc3).withOpacity(.6)),
            child: GestureDetector(
              onTap: () => print(''),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width * .9,
                    child: Material(
                      textStyle: TextStyle(color: Colors.black),
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerRight,
                              child: InkWell(
                                  onTap: () => Navigator.pop(context),
                                  child: Icon(
                                    Icons.clear,
                                    color: Colors.grey,
                                  )),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(children: [
                                          TextSpan(
                                              text: "Oops!\n",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: 'Gotham',
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold)),
                                          WidgetSpan(
                                              child: Container(
                                            height: 10.0,
                                          )),
                                          TextSpan(
                                              text: error + "\n\n",
                                              style: TextStyle(
                                                  fontFamily: "Gotham",
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 12)),
                                        ])),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      });
}

void addedToIntersted() {
  Get.dialog(
    GestureDetector(
      onTap: () => Get.back(),
      child: Container(
        width: Get.width,
        height: Get.height,
        decoration: BoxDecoration(color: Color(0xff1f1f1f).withOpacity(0.90)),
        child: GestureDetector(
          onTap: () => print(''),
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: Container(
                color: Colors.white,
                width: Get.width * .9,
                height: Get.height * .5,
                child: Material(
                  textStyle: TextStyle(color: Colors.black),
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                            left: 15,
                            top: Get.height * .05,
                            bottom: Get.height * 0.05,
                          ),
                          child: SvgPicture.asset(
                            'assets/images/auctionpopup1.svg',
                            height: Get.height * 0.15,
                          ),
                        ),
                        Container(
                          height: Get.height * 0.1,
                          width: Get.width * 0.6,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Text(
                              "You_have_been_added_to_those_interested_in".tr +
                                  "\n" +
                                  "The_auction".tr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Color(0xff1e1e1e),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: Get.height * 0.05,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.offAll(HomeView());
                                },
                                child: AnimatedContainer(
                                    duration: Duration(milliseconds: 0),
                                    height: Get.width * 0.1,
                                    width: Get.width * .4,
                                    decoration: BoxDecoration(
                                      color: Color(0xff3686bd),
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(0.00, 2.00),
                                          color: Colors.white,
                                          blurRadius: 4,
                                        ),
                                      ],
                                      borderRadius:
                                          BorderRadius.circular(10.00),
                                    ),
                                    child: Center(
                                        child: new Text(
                                      "Main".tr,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xffffffff),
                                      ),
                                    ))),
                              ),
                              SizedBox(
                                width: Get.width * 0.05,
                              ),
                              InkWell(
                                onTap: () {
                                  Get.off(AuctionView());
                                },
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 0),
                                  height: Get.width * 0.1,
                                  width: Get.width * .4,
                                  decoration: BoxDecoration(
                                    color: Color(0xff3686bd),
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(0.00, 2.00),
                                        color: Colors.white,
                                        blurRadius: 4,
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(10.00),
                                  ),
                                  child: Center(
                                    child: new Text(
                                      "My_interests".tr,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xffffffff),
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
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

void joinAuction() {
  Get.dialog(GestureDetector(
    onTap: () => Get.back(), // Navigator.pop(context),
    child: Container(
      width: Get.width,
      height: Get.height,
      decoration: BoxDecoration(color: Color(0xff1f1f1f).withOpacity(0.90)),
      child: GestureDetector(
        onTap: () => print(''),
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6.0),
            child: Container(
              color: Colors.white,
              width: Get.width * .9,
              height: Get.height * .5,
              child: Material(
                textStyle: TextStyle(color: Colors.black),
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                          left: 15,
                          top: Get.height * .05,
                          bottom: Get.height * 0.05,
                        ),
                        child: Image.asset(
                          'assets/images/joinauction.png',
                          height: Get.height * 0.15,
                        ),
                      ),
                      Container(
                        height: Get.height * 0.1,
                        width: Get.width * 0.6,
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Text(
                            "Successfully_joined_the_auction".tr +
                                "\n" +
                                "Remaining".tr +
                                " 100" +
                                "m".tr +
                                " " +
                                "To_start_the_auction".tr,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Color(0xff1e1e1e),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: Get.height * 0.05,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.offAll(HomeView());
                              },
                              child: AnimatedContainer(
                                  duration: Duration(milliseconds: 0),
                                  height: Get.width * 0.1,
                                  width: Get.width * .4,
                                  decoration: BoxDecoration(
                                    color: Color(0xff3686bd),
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(0.00, 2.00),
                                        color: Colors.white,
                                        blurRadius: 4,
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(10.00),
                                  ),
                                  child: Center(
                                      child: new Text(
                                    "Main".tr,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xffffffff),
                                    ),
                                  ))),
                            ),
                            SizedBox(
                              width: Get.width * 0.05,
                            ),
                            InkWell(
                              onTap: () {
                                Share.share(
                                  "Qima",
                                  subject: "Share With Friends!",
                                  // sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
                                );
                              },
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 0),
                                height: Get.width * 0.1,
                                width: Get.width * .4,
                                decoration: BoxDecoration(
                                  color: Color(0xff3686bd),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0.00, 2.00),
                                      color: Colors.white,
                                      blurRadius: 4,
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(10.00),
                                ),
                                child: Center(
                                  child: new Text(
                                    "Share".tr,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xffffffff),
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
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  ));
}

void winningAuction(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return GestureDetector(
          onTap: () => Get.back(), //Navigator.pop(context),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration:
                BoxDecoration(color: Color(0xff1f1f1f).withOpacity(0.90)),
            child: GestureDetector(
              onTap: () => print(''),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6.0),
                  child: Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width * .9,
                    height: MediaQuery.of(context).size.height * .48,
                    child: Material(
                      textStyle: TextStyle(color: Colors.black),
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 15,
                                  top:
                                      MediaQuery.of(context).size.height * .03),
                              child:
                                  SvgPicture.asset('assets/winningauction.svg'),
                            ),
                            Padding(
                                padding: EdgeInsets.only(top: 35.0),
                                child: new Text(
                                  "مبرووك لقد فزت بالمزاد\n 0912300000",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff1e1e1e),
                                  ),
                                )),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 35.0, right: 15, left: 15),
                              child: InkWell(
                                onTap: () {},
                                child: AnimatedContainer(
                                    duration: Duration(milliseconds: 0),
                                    height: 50.00,
                                    width:
                                        MediaQuery.of(context).size.width * .8,
                                    decoration: BoxDecoration(
                                      color: Color(0xff3686bd),
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(0.00, 2.00),
                                          color: Colors.white,
                                          blurRadius: 4,
                                        ),
                                      ],
                                      borderRadius:
                                          BorderRadius.circular(10.00),
                                    ),
                                    child: Center(
                                        child: new Text(
                                      "مراسلة البائع الأن ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xffffffff),
                                      ),
                                    ))),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      });
}

void losingAuction(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return GestureDetector(
          onTap: () => Get.back(), //Navigator.pop(context),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration:
                BoxDecoration(color: Color(0xff1f1f1f).withOpacity(0.90)),
            child: GestureDetector(
              onTap: () => print(''),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6.0),
                  child: Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width * .9,
                    height: MediaQuery.of(context).size.height * .48,
                    child: Material(
                      textStyle: TextStyle(color: Colors.black),
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 15,
                                  top:
                                      MediaQuery.of(context).size.height * .03),
                              child:
                                  SvgPicture.asset('assets/losingauction.svg'),
                            ),
                            Padding(
                                padding: EdgeInsets.only(top: 15.0),
                                child: new Text(
                                  "لقد انتهي المزاد ",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff1e1e1e),
                                  ),
                                )),
                            Padding(
                                padding: EdgeInsets.only(top: 15.0),
                                child: new Text(
                                  "للأسف لم توفق بالفوز بهذا المزاد سارع بلانضمام الي مزاد مشابة",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xff4e4e4e),
                                  ),
                                )),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 15.0, right: 15, left: 15),
                              child: InkWell(
                                onTap: () {},
                                child: AnimatedContainer(
                                    duration: Duration(milliseconds: 0),
                                    height: 50.00,
                                    width:
                                        MediaQuery.of(context).size.width * .8,
                                    decoration: BoxDecoration(
                                      color: Color(0xff3686bd),
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(0.00, 2.00),
                                          color: Colors.white,
                                          blurRadius: 4,
                                        ),
                                      ],
                                      borderRadius:
                                          BorderRadius.circular(10.00),
                                    ),
                                    child: Center(
                                        child: new Text(
                                      "رؤية مزادات اخري",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xffffffff),
                                      ),
                                    ))),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      });
}

void postPopup(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return GestureDetector(
          onTap: () => Get.back(), //Navigator.pop(context),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.92),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0.00, 10.00),
                  color: Color(0xff8a959e).withOpacity(0.20),
                  blurRadius: 20,
                ),
              ],
              borderRadius: BorderRadius.circular(14.00),
            ),
            child: GestureDetector(
              onTap: () => print(''),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6.0),
                  child: Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width * .9,
                    height: MediaQuery.of(context).size.height * .48,
                    child: Material(
                      textStyle: TextStyle(color: Colors.black),
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 15,
                                  top:
                                      MediaQuery.of(context).size.height * .03),
                              child: SvgPicture.asset('assets/postsignup.svg'),
                            ),
                            Padding(
                                padding: EdgeInsets.only(top: 10.0),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  height:
                                      MediaQuery.of(context).size.height * .1,
                                  child: FittedBox(
                                    fit: BoxFit.fill,
                                    child: Text(
                                      "تم تسجيل حسابك بنجاح. لإكمال العملية \n  يرجى التحقق ادخال الرمز الذي تم ارسالة إلى \nهاتفك",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xff464646),
                                      ),
                                    ),
                                  ),
                                )),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 0.0, right: 15, left: 15),
                              child: InkWell(
                                onTap: () {
                                  Get.back();
                                  //  Get.to(SignupView());
                                  // Navigator.pop(context);
                                  // Navigator.of(context).push(MaterialPageRoute(
                                  //   builder: (context) => PostSignUp(),
                                  // ));
                                },
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 0),
                                  height: 50.00,
                                  width: MediaQuery.of(context).size.width * .8,
                                  decoration: BoxDecoration(
                                    color: Color(0xff3686bd),
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(0.00, 2.00),
                                        color: Colors.white,
                                        blurRadius: 4,
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(10.00),
                                  ),
                                  child: Center(
                                    child: new Text(
                                      " حسنا ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xffffffff),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      });
}

Widget createAccount() {
  // Get.dialog(
  //   GestureDetector(
  // onTap: () => Get.back(), // Navigator.pop(context),
  // child:
  return Center(
    child: Card(
      elevation: 7,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6.0),
        child: Container(
          color: Colors.white,
          width: Get.width * .9,
          height: Get.height * .5,
          child: Material(
            textStyle: TextStyle(color: Colors.black),
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      left: 15,
                      top: Get.height * .05,
                      bottom: Get.height * 0.05,
                    ),
                    child: SvgPicture.asset(
                      'assets/images/login.svg',
                      height: Get.height * 0.15,
                    ),
                  ),
                  Container(
                    height: Get.height * 0.1,
                    width: Get.width * 0.6,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        "To_confirm_your_auction_you".tr +
                            "\n" +
                            "Must_create_an_account".tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Color(0xff1e1e1e),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: Get.height * 0.05,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Get.width * 0.025),
                            child: InkWell(
                              onTap: () {
                                Get.offAll(RegistrationView());
                              },
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 0),
                                height: Get.width * 0.12,
                                // width: Get.width * .4,
                                decoration: BoxDecoration(
                                  color: Color(0xff3686bd),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0.00, 2.00),
                                      color: Colors.white,
                                      blurRadius: 4,
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(10.00),
                                ),
                                child: Center(
                                  child: new Text(
                                    "Create_an_account".tr,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xffffffff),
                                    ),
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
            ),
          ),
        ),
      ),
    ),
  );
  //   ),
  // );
}
