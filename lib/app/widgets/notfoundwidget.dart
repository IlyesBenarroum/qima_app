import 'package:flutter/material.dart';

class NotFoundWidget extends StatefulWidget {
  const NotFoundWidget({
    @required this.title,
    Key key,
  }) : super(key: key);
  final String title;

  @override
  _NotFoundWidgetState createState() => _NotFoundWidgetState();
}

class _NotFoundWidgetState extends State<NotFoundWidget> {
  @override
  Widget build(BuildContext context) {
    setState(() {});
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            "assets/images/NotFound.png",
          ),
          Center(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                '${widget.title}',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
