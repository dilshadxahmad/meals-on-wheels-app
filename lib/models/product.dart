import 'package:meals_on_wheels/models/abstract/base_model.dart';
import 'package:meals_on_wheels/utils/my_images.dart';

class Product extends BaseModel {
  String name;
  int categoryId;

  String? description;
  String? caloryCount;
  double price;
  String image;
  Product({
    required super.id,
    required this.categoryId,
    required this.name,
    this.description,
    this.caloryCount,
    required this.price,
    required this.image,
  });
}

final List<Product> productsMock = [
  Product(
      id: 114,
      categoryId: 1,
      name: "Classic Cheeseburger",
      description: "Juicy beef patty",
      caloryCount: "550",
      price: 13.99,
      image: MyImages.cheeseBurger),
  Product(
      id: 115,
      categoryId: 1,
      name: "Special Pizza",
      description: "Special lasagna pizza",
      caloryCount: "320",
      price: 9.99,
      image: MyImages.pizza),
  Product(
      id: 116,
      categoryId: 1,
      name: "Loaded Fries",
      description: "Cheese topped Fries",
      caloryCount: "420",
      price: 11.99,
      image: MyImages.fries),
  Product(
      id: 102,
      categoryId: 2,
      name: "Grilled Salmon",
      description: "Freshly grilled salmon",
      caloryCount: "250",
      price: 18.99,
      image: MyImages.salmon),
  Product(
      id: 105,
      categoryId: 2,
      name: "Teriyaki Salmon Bowl",
      description: "Teriyaki glazed salmon",
      caloryCount: "300",
      price: 16.99,
      image: MyImages.salmon2),
  Product(
      id: 108,
      categoryId: 2,
      name: "Lemon Garlic Shrimp",
      description: "Succulent shrimp",
      caloryCount: "280",
      price: 20.99,
      image: MyImages.shrimp),
  Product(
      id: 103,
      categoryId: 3,
      name: "Chocolate Lava Cake",
      description: "Rich chocolate goodness",
      price: 8.99,
      image: MyImages.cone),
  Product(
      id: 106,
      categoryId: 3,
      name: "Triple Chocolate Mousse",
      description: "Layers chocolate indulgence",
      price: 10.99,
      image: MyImages.mousse),
  Product(
      id: 109,
      categoryId: 3,
      name: "Red Velvet Cupcake",
      description: "Classic red velvet",
      price: 7.99,
      image: MyImages.cupCake),
  Product(
      id: 101,
      categoryId: 4,
      name: "Vegetarian Delight",
      description: "Healthy tasty dish",
      caloryCount: "350",
      price: 12.99,
      image: MyImages.vegetarian),
  Product(
      id: 104,
      categoryId: 4,
      name: "Mushroom Risotto",
      description: "Creamy mushroom risotto",
      caloryCount: "400",
      price: 14.99,
      image: MyImages.mushroom),
  Product(
      id: 107,
      categoryId: 4,
      name: "Caprese Salad",
      description: "Mozzarella tomatoes & basil",
      caloryCount: "200",
      price: 9.99,
      image: MyImages.salad),
];
