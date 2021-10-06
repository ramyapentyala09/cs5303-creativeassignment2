import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final IconData iconData;
  final GestureTapCallback onClick;

  CircleButton({required this.iconData, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onClick,
      child: Icon(iconData),
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
