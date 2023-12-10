import 'package:flutter/material.dart';
import 'package:meals_on_wheels/models/product_category.dart';
import 'package:meals_on_wheels/models/product.dart';
import 'package:meals_on_wheels/models/user.dart';
import 'package:meals_on_wheels/screens/drawer/app_drawer.dart';
import 'package:meals_on_wheels/screens/profile_screen.dart';
import 'package:meals_on_wheels/utils/english_text.dart';
import 'package:meals_on_wheels/utils/my_colors.dart';
import 'package:meals_on_wheels/view_models/app_drawer_vm.dart';
import 'package:meals_on_wheels/view_models/home_screen_vm.dart';
import 'package:meals_on_wheels/view_models/profile_screen_vm.dart';
import 'package:meals_on_wheels/widgets/buttons/primary_button.dart';
import 'package:meals_on_wheels/widgets/cards/product_card.dart';
import 'package:meals_on_wheels/widgets/containers/rounded_container.dart';
import 'package:meals_on_wheels/widgets/image_widgets/rounded_image.dart';
import 'package:meals_on_wheels/widgets/text/display_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenVM? _homeScreenData;
  final List<ProductCategory> _selectedCategories = [];

  @override
  void initState() {
    super.initState();
    // Mock data for HomeScreenVM class
    _homeScreenData = HomeScreenVM(
      userName: usersMock[0].name,
      userImage: usersMock[0].image,
      categories: [
        productCategoriesMock[0],
        productCategoriesMock[1],
        productCategoriesMock[2]
      ],
      products: [productsMock[0], productsMock[1], productsMock[2]],
    );
  }

  @override
  Widget build(BuildContext context) {
    final selectedCategoryIds =
        _selectedCategories.map((category) => category.id).toList();

    final filteredProducts = productsMock.where((product) {
      return _selectedCategories.isEmpty ||
          selectedCategoryIds.contains(product.categoryId);
    }).toList();

    return Scaffold(
      drawer: AppDrawer(
        appDrawerVM: AppDrawerVM(
          userName: _homeScreenData?.userName ?? "",
          userImage: _homeScreenData?.userImage ?? "",
        ),
      ),
      appBar: AppBar(
        actions: [
          Tooltip(
            message: "Profile",
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return ProfileScreen(
                        profileScreenVM: ProfileScreenVM(
                          userName: _homeScreenData?.userName ?? "",
                          userImage: _homeScreenData?.userImage ?? "",
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
              child: RoundedContainer(
                backgroundColor: MyColors.orange,
                margin: const EdgeInsets.only(right: 16),
                height: 36,
                width: 36,
                child:
                    RoundedImage(imageName: _homeScreenData?.userImage ?? ""),
              ),
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            height: 68,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DisplayText(
                  "${EnglishText.hi}, ${_homeScreenData?.userName ?? ""}",
                ),
                const DisplayText(EnglishText.letsEat),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PrimaryButton(
                  width: 300,
                  onPressed: () {},
                  backgroundColor: MyColors.black.withOpacity(0.05),
                  overlayColor: MyColors.black.withOpacity(0.1),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.search_rounded,
                        color: MyColors.black,
                      ),
                      SizedBox(width: 8),
                      Text(
                        EnglishText.searchFood,
                        style: TextStyle(
                          color: MyColors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  tooltip: "Filter Results",
                  style: ButtonStyle(
                    backgroundColor:
                        const MaterialStatePropertyAll(MyColors.orange),
                    overlayColor: MaterialStatePropertyAll(
                        MyColors.black.withOpacity(0.1)),
                  ),
                  onPressed: () {},
                  icon: const Icon(
                    Icons.tune_rounded,
                    color: MyColors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 380,
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    scrollDirection: Axis.horizontal,
                    itemCount: productCategoriesMock.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          FilterChip(
                            tooltip:
                                "Filter ${productCategoriesMock[index].name}s",
                            selected: _selectedCategories
                                .contains(productCategoriesMock[index]),
                            showCheckmark: false,
                            avatar: productCategoriesMock[index].iconImage,
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: _selectedCategories
                                      .contains(productCategoriesMock[index])
                                  ? MyColors.white
                                  : MyColors.black,
                            ),
                            label: Text(
                              productCategoriesMock[index].name,
                            ),
                            onSelected: (selected) {
                              setState(() {
                                if (selected) {
                                  _selectedCategories
                                      .add(productCategoriesMock[index]);
                                } else {
                                  _selectedCategories
                                      .remove(productCategoriesMock[index]);
                                }
                              });
                            },
                          ),
                          const SizedBox(width: 16),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 300,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    scrollDirection: Axis.horizontal,
                    itemCount: filteredProducts.length,
                    itemBuilder: (context, index) {
                      return ProductCard(
                        image: filteredProducts[index].image,
                        title: filteredProducts[index].name,
                        description1: filteredProducts[index].description ?? "",
                        description2: filteredProducts[index].caloryCount ?? "",
                        price: filteredProducts[index].price,
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
