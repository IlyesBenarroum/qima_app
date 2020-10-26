import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qima/app/modules/home/home_view.dart';

String confirmationNumber = "";
var lang = Get.locale.languageCode;

class NumberConfirmation extends StatelessWidget {
  Widget build(BuildContext context) {
    print(lang);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: MediaQuery.of(context).size.height * .16),
                new Text(
                  "Enter_the_verification_code".tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Speda",
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                    color: Color(0xff161616),
                  ),
                ),
                new Text(
                  lang == "ar"
                      ? "Enter_the_code_that_was_sent_to_the_number".tr +
                          "\n" +
                          "1-541-754-3010 (249+)"
                      : "Enter_the_code_that_was_sent_to_the_number".tr +
                          "\n" +
                          "(+249) 2-541-754-3010",
                  // "\nأدخل الرمز الذي تم ارسالة الي الرقم\n(+249) 1-541-754-3010. ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Speda",
                    fontSize: 17,
                    color: Color(0xff464646),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(40),
                  child: Card(
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Center(
                        child: Container(
                          height: 80,
                          decoration: BoxDecoration(
                            color: Color(0xffffffff),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0.00, 8.00),
                                color: Color(0xff000000).withOpacity(0.08),
                                blurRadius: 16,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(20.00),
                          ),
                          child: TextField(
                            onChanged: (value) {
                              confirmationNumber = value;
                            },
                            maxLengthEnforced: true,
                            maxLength: 4,
                            decoration: InputDecoration(
                              isDense: true,
                              counterText: "",
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(top: 20),
                            ),
                            cursorColor: Color(0xffe3f4f6),
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 40,
                              decoration: TextDecoration.underline,
                              color: Color(0xff3686bd),
                            ),
                          ),
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 35.0),
                  child: InkWell(
                    onTap: () {
                      if (confirmationNumber.length == 4) Get.off(HomeView());
                      // Navigator.of(context).push(MaterialPageRoute(
                      //   builder: (context) => HomePage(),
                      // ));
                    },
                    child: AnimatedContainer(
                        duration: Duration(milliseconds: 0),
                        height: 60.00,
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
                          "Next".tr,
                          style: TextStyle(
                            fontFamily: "Speda",
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Color(0xffffffff),
                          ),
                        ))),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: new Text(
                        " " + "Resend".tr + " ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Speda",
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: Color(0xff3686bd),
                        ),
                      ),
                    ),
                    new Text(
                      "Did_not_receive_the_code".tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Speda",
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: Color(0xff525252),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
