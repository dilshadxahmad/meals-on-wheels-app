import 'package:meals_on_wheels/models/product_category.dart';
import 'package:meals_on_wheels/models/product.dart';

class HomeScreenVM {
  String userName;
  String userImage;
  List<ProductCategory> categories;
  List<Product> products;
  HomeScreenVM({
    required this.userName,
    required this.userImage,
    required this.categories,
    required this.products,
  });
}
