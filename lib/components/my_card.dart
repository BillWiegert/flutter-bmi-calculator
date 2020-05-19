import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final Color color;
  final Widget child;
  final Function onPress;

  MyCard({this.color = kActiveCardColor, this.child, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: child,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: color,
        ),
      ),
    );
  }
}
