import 'package:flutter/material.dart';
import 'package:meals_on_wheels/screens/profile_screen.dart';
import 'package:meals_on_wheels/view_models/app_drawer_vm.dart';
import 'package:meals_on_wheels/view_models/profile_screen_vm.dart';
import 'package:meals_on_wheels/widgets/buttons/transparent_button.dart';
import 'package:meals_on_wheels/widgets/image_widgets/rounded_image.dart';
import 'package:meals_on_wheels/widgets/text/display_text.dart';

class AppDrawer extends StatelessWidget {
  final AppDrawerVM appDrawerVM;
  const AppDrawer({required this.appDrawerVM, super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 230,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: Row(
              children: [
                SizedBox(
                  width: 64,
                  child: RoundedImage(imageName: appDrawerVM.userImage),
                ),
                const SizedBox(width: 16),
                DisplayText(
                  appDrawerVM.userName,
                  fontSize: 18,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          TransparentButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return ProfileScreen(
                      profileScreenVM: ProfileScreenVM(
                        userName: appDrawerVM.userName,
                        userImage: appDrawerVM.userImage,
                        userLocation: "San Francisco, CA",
                        totalOrders: 45,
                        walletAmount: 95.2,
                        rating: 4.8,
                      ),
                    );
                  },
                ),
              );
            },
            child: const Text("Profile"),
          ),
          const SizedBox(height: 16),
          TransparentButton(
            onPressed: () {},
            child: const Text("Home"),
          ),
          const SizedBox(height: 16),
          TransparentButton(
            onPressed: () {},
            child: const Text("History"),
          ),
          const SizedBox(height: 16),
          TransparentButton(
            onPressed: () {},
            child: const Text("Account"),
          ),
          const SizedBox(height: 16),
          TransparentButton(
            onPressed: () {},
            child: const Text("Logout"),
          ),
        ],
      ),
    );
  }
}
