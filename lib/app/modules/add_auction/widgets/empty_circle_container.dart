import 'package:flutter/material.dart';

class EmptyCircleContainer extends StatelessWidget {
  const EmptyCircleContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenWidth * 0.05,
      width: screenWidth * 0.05,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: 2,
          color: Colors.white,
        ),
      ),
    );
  }
}
