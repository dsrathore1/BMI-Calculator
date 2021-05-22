import 'package:flutter/material.dart';

class LeftBar extends StatelessWidget {
  final double barWidth;
  const LeftBar({Key key, @required this.barWidth}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: barWidth,
          height: 20,
          decoration: BoxDecoration(
            color: Colors.amberAccent,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
          ),
        )
      ],
    );
  }
}
