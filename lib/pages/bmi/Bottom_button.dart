import 'package:flutter/material.dart';

import 'constants.dart';

class BottomButtonWidget extends StatelessWidget {
  final String? title;
  final GestureTapCallback? onclick;

  BottomButtonWidget({this.title, this.onclick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onclick,
      child: Padding(
        padding: EdgeInsets.only(bottom: 20.0),
        child: Container(
          child: Center(
            child: Text(
              title!,
              style: kLargeButtonTextStyle,
            ),
          ),
          margin: EdgeInsets.only(top: 10.0),
          color: kBottomContainerColor,
          height: kBottomContainerHeight,
          width: double.infinity,
        ),
      ),
    );
  }
}
