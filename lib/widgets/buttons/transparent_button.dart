import 'package:flutter/material.dart';
import 'package:meals_on_wheels/utils/my_colors.dart';

class TransparentButton extends StatelessWidget {
  final void Function()? onPressed;
  final Widget child;
  final double? width;
  final double? height;
  const TransparentButton({
    required this.onPressed,
    required this.child,
    this.width,
    this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.maxFinite,
      height: height ?? 45,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: const MaterialStatePropertyAll(Colors.transparent),
          foregroundColor: const MaterialStatePropertyAll(MyColors.black),
          overlayColor:
              MaterialStatePropertyAll(MyColors.black.withOpacity(0.1)),
        ),
        child: child,
      ),
    );
  }
}
