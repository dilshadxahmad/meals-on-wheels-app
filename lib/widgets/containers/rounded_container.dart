import 'package:flutter/material.dart';
import 'package:meals_on_wheels/utils/my_colors.dart';

class RoundedContainer extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? height;
  final double? width;
  final double? borderRadius;

  const RoundedContainer({
    required this.child,
    this.backgroundColor,
    this.padding,
    this.margin,
    this.height,
    this.width,
    this.borderRadius,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      height: height ?? 56,
      width: width ?? 56,
      decoration: BoxDecoration(
        color: backgroundColor ?? MyColors.yellow,
        borderRadius: BorderRadius.circular(borderRadius ?? 50),
      ),
      child: child,
    );
  }
}
