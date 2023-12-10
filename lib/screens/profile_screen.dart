import 'package:flutter/material.dart';
import 'package:meals_on_wheels/utils/my_colors.dart';
import 'package:meals_on_wheels/view_models/profile_screen_vm.dart';
import 'package:meals_on_wheels/widgets/image_widgets/rounded_image.dart';
import 'package:meals_on_wheels/widgets/text/display_text.dart';

class ProfileScreen extends StatelessWidget {
  final ProfileScreenVM profileScreenVM;
  const ProfileScreen({required this.profileScreenVM, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.orange,
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
              height: 400,
              width: 400,
              color: MyColors.milky,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Bio:\n"),
                  Text(
                      "Passionate foodie and tech enthusiast bringing delicious eats to your doorstep! 🍔🚀 Order from a variety of cuisines with our user-friendly app for a taste bud adventure. Your next flavorful experience is just a click away! #FoodDeliveryMagic "),
                ],
              ),
            ),
          ),
          Column(
            children: [
              Container(
                height: 300,
                width: double.maxFinite,
                padding:
                    const EdgeInsets.only(left: 150, right: 150, bottom: 100),
                decoration: const BoxDecoration(
                  color: MyColors.milky,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
              ),
              Container(
                height: 90,
                width: double.maxFinite,
                decoration: const BoxDecoration(
                  color: MyColors.orange,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    twoLineText(
                        title: profileScreenVM.totalOrders.toString(),
                        subTitle: "Orders"),
                    twoLineText(
                        title:
                            "\$ ${profileScreenVM.walletAmount.toStringAsFixed(2)}",
                        subTitle: "in wallet"),
                    twoLineText(
                        title: "${profileScreenVM.rating.toStringAsFixed(1)} ⭐",
                        subTitle: "Rating"),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 100,
            child: Column(
              children: [
                SizedBox(
                  height: 80,
                  width: 80,
                  child: RoundedImage(
                    imageName: profileScreenVM.userImage,
                  ),
                ),
                const SizedBox(height: 16),
                DisplayText(profileScreenVM.userName),
                Text(profileScreenVM.userLocation),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SizedBox twoLineText({
    required String title,
    required String subTitle,
  }) {
    return SizedBox(
      child: Column(
        children: [
          const SizedBox(height: 16),
          DisplayText(
            title,
            fontColor: MyColors.white,
          ),
          Text(
            subTitle,
            style: const TextStyle(
              color: MyColors.white,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
