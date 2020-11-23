import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_svg/flutter_svg.dart';


double screenHeight = Get.height;
double screenWidth = Get.width;




class SocialMediaCard extends StatelessWidget {
  const SocialMediaCard({
    @required this.asset,
    Key key,
  }) : super(key: key);
  final String asset;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      child: Container(
        height: screenHeight * 0.065,
        width: screenHeight * 0.065,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Center(
          child: SvgPicture.asset(
            asset,
            height: screenHeight * 0.03,
            width: screenHeight * 0.03,
          ),
        ),
      ),
    );
  }
}
