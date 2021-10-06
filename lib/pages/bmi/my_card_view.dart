import 'package:flutter/material.dart';

class MyCardView extends StatelessWidget {
  final Color? myColor;
  final Widget? cardChild;
  final GestureTapCallback? onPress;

  MyCardView({this.myColor, this.cardChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: myColor, borderRadius: BorderRadius.circular(10.0)),
        child: cardChild,
      ),
    );
  }
}
