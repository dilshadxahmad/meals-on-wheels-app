import 'package:flutter/material.dart';
import 'package:meals_on_wheels/models/abstract/base_model.dart';
import 'package:meals_on_wheels/utils/my_images.dart';

class ProductCategory extends BaseModel {
  String name;
  Widget iconImage;
  ProductCategory({
    required super.id,
    required this.name,
    required this.iconImage,
  });
}

final List<ProductCategory> productCategoriesMock = [
  ProductCategory(
    id: 1,
    name: "Fast Food",
    iconImage: Image.asset(MyImages.hamburger),
  ),
  ProductCategory(
    id: 2,
    name: "Seafood",
    iconImage: Image.asset(MyImages.octopus),
  ),
  ProductCategory(
    id: 3,
    name: "Desserts",
    iconImage: Image.asset(MyImages.chocolate),
  ),
  ProductCategory(
    id: 4,
    name: "Vegetarian",
    iconImage: Image.asset(MyImages.broccoli),
  ),
];
