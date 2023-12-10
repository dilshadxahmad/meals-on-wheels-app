import 'package:flutter/material.dart';
import 'package:meals_on_wheels/utils/my_colors.dart';
import 'package:meals_on_wheels/widgets/text/display_text.dart';

class ProductCard extends StatelessWidget {
  final String image;
  final String title;
  final String description1;
  final String description2;
  final double price;
  const ProductCard({
    required this.image,
    required this.title,
    required this.description1,
    required this.description2,
    required this.price,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      child: Card(
        margin: const EdgeInsets.only(right: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              image,
              height: 100,
            ),
            DisplayText(
              title,
              textAlignment: TextAlign.center,
            ),
            Text(
              description1,
              style: const TextStyle(
                color: MyColors.grey,
              ),
            ),
            Text(
              "🔥 $description2 Calories",
              style: const TextStyle(
                color: MyColors.orange,
              ),
            ),
            DisplayText("\$ $price"),
          ],
        ),
      ),
    );
  }
}
