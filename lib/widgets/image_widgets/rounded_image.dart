import 'package:flutter/material.dart';

class RoundedImage extends StatelessWidget {
  final String imageName;
  final double? borderRadius;
  const RoundedImage({required this.imageName, this.borderRadius, super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius ?? 10),
      child: Image.asset(imageName),
    );
  }
}
