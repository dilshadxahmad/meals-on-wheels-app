import 'package:flutter/material.dart';
import 'package:meals_on_wheels/utils/my_colors.dart';

class DisplayText extends Text {
  final Color? fontColor;
  final double? fontSize;
  final TextAlign? textAlignment;
  const DisplayText(super.data,
      {this.fontColor, this.fontSize, this.textAlignment, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      data ?? "",
      style: TextStyle(
        color: fontColor ?? MyColors.black,
        fontSize: fontSize ?? 22,
        fontWeight: FontWeight.bold,
        letterSpacing: -0.25,
      ),
      textAlign: textAlignment,
    );
  }
}
