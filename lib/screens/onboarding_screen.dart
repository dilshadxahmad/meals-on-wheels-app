import 'package:flutter/material.dart';
import 'package:meals_on_wheels/components/page_indicator.dart';
import 'package:meals_on_wheels/screens/login_screen.dart';
import 'package:meals_on_wheels/utils/english_text.dart';
import 'package:meals_on_wheels/utils/my_colors.dart';
import 'package:meals_on_wheels/utils/my_images.dart';
import 'package:meals_on_wheels/widgets/buttons/primary_button.dart';
import 'package:meals_on_wheels/widgets/text/display_text.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(MyImages.abstractWhiteBg),
            fit: BoxFit.cover,
            opacity: 0.2,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.only(right: 80),
                  transform: Matrix4.rotationZ(-0.48),
                  child: Image.asset(MyImages.deliveryGuyIllustration,
                      height: 200),
                ),
                const SizedBox(
                  height: 80,
                ),
                SizedBox(
                  height: 96,
                  child: PageView(
                    onPageChanged: (index) {
                      setState(() {
                        _pageIndex = index;
                      });
                    },
                    children: [
                      twoLineText(
                        title: EnglishText.appName,
                        subTitle: EnglishText.onboardingScreenText1,
                      ),
                      twoLineText(
                        title: EnglishText.onboardingScreenText2,
                        subTitle: EnglishText.onboardingScreenText3,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...List.generate(
                      2,
                      (index) {
                        return PageIndicator(isActive: _pageIndex == index);
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 128,
                ),
                PrimaryButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return const LoginScreen();
                        },
                      ),
                    );
                  },
                  child: const Text(
                    EnglishText.letsGo,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
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
          DisplayText(
            title,
            fontColor: MyColors.orange,
          ),
          Text(
            subTitle,
            style: const TextStyle(
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
