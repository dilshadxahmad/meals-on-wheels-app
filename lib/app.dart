import 'package:flutter/material.dart';
import 'package:meals_on_wheels/config/theme_config.dart';
import 'package:meals_on_wheels/screens/onboarding_screen.dart';

class MealsOnWheelsApp extends StatelessWidget {
  const MealsOnWheelsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeConfig.lightTheme(),
      // darkTheme: ThemeConfig.darkTheme(),
      home: const OnboardingScreen(),
    );
  }
}
