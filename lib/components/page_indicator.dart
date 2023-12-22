import 'package:flutter/material.dart';
import 'package:meals_on_wheels/utils/my_colors.dart';

class PageIndicator extends StatelessWidget {
  final bool isActive;
  const PageIndicator({required this.isActive, super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.ease,
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 2),
      width: isActive ? 16 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: isActive ? MyColors.orange : MyColors.grey,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
