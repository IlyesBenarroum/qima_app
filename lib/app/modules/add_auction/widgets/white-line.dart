import 'package:flutter/material.dart';

class WhiteLine extends StatelessWidget {
  const WhiteLine({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 2,
      width: screenWidth * 0.285,
      color: Colors.white,
    );
  }
}
