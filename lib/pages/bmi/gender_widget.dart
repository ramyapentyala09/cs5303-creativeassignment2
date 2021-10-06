import 'package:flutter/material.dart';

import 'constants.dart';

class GenderWidget extends StatelessWidget {
  final IconData icon;
  final String text;

  GenderWidget({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(text, style: kGenderTextStyle)
      ],
    );
  }
}
