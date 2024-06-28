import 'package:flutter/material.dart';
import 'package:greemgrocer/src/config/custom_colors.dart';

class AppNameWidget extends StatelessWidget {
  final Color greenTitleColor;
  final double fontSize;

  const AppNameWidget({
    super.key,
    this.greenTitleColor = Colors.white,
    this.fontSize = 30,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(
      style: TextStyle(
        fontSize: fontSize,
      ),
      children: [
        TextSpan(
          text: 'Green',
          style: TextStyle(
            color: greenTitleColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
            text: 'grocer',
            style: TextStyle(color: CustomColor.customContrastColor))
      ],
    ));
  }
}
