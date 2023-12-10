import 'package:meals_on_wheels/models/abstract/base_model.dart';
import 'package:meals_on_wheels/utils/my_images.dart';

class User extends BaseModel {
  String name;
  String image;
  User({required super.id, required this.name, required this.image});
}

final List<User> usersMock = [
  User(id: 1, name: "John Doe", image: MyImages.userImage1),
];
