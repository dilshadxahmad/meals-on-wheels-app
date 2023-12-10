import 'package:flutter/material.dart';
import 'package:meals_on_wheels/utils/my_colors.dart';
import 'package:meals_on_wheels/utils/my_fonts.dart';

class ThemeConfig {
  static ThemeData lightTheme() {
    return ThemeData(
      useMaterial3: true,
      canvasColor: MyColors.white,
      scaffoldBackgroundColor: MyColors.milky,
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(
          size: 24,
          fill: 0,
          color: MyColors.black,
        ),
        actionsIconTheme: IconThemeData(
          color: MyColors.black,
        ),
        backgroundColor: MyColors.milky,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 18,
          color: MyColors.black,
        ),
      ),
      fontFamily: MyFonts.ralewayFont,
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: MyColors.orange,
        linearTrackColor: MyColors.lightOrange,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: const MaterialStatePropertyAll(MyColors.orange),
          foregroundColor: const MaterialStatePropertyAll(MyColors.white),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          overlayColor:
              MaterialStatePropertyAll(MyColors.black.withOpacity(0.1)),
          elevation: const MaterialStatePropertyAll(0),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: const MaterialStatePropertyAll(MyColors.orange),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          side: const MaterialStatePropertyAll(
            BorderSide(color: MyColors.orange),
          ),
          overlayColor:
              MaterialStatePropertyAll(MyColors.orange.withOpacity(0.1)),
          elevation: const MaterialStatePropertyAll(0),
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          iconSize: const MaterialStatePropertyAll(24),
          backgroundColor: const MaterialStatePropertyAll(Colors.transparent),
          foregroundColor: const MaterialStatePropertyAll(MyColors.black),
          overlayColor:
              MaterialStatePropertyAll(MyColors.black.withOpacity(0.1)),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
      chipTheme: ChipThemeData(
        padding: const EdgeInsets.all(12),
        backgroundColor: MyColors.white,
        selectedColor: MyColors.orange,
        side: BorderSide.none,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(
            color: Colors.transparent,
            width: 0.1,
          ),
        ),
      ),
      cardTheme: CardTheme(
        color: MyColors.white,
        surfaceTintColor: Colors.transparent,
        shadowColor: MyColors.lightGrey.withOpacity(0.1),
        elevation: 8,
      ),
      drawerTheme: const DrawerThemeData(
        backgroundColor: MyColors.milky,
        surfaceTintColor: Colors.transparent,
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: MyColors.white,
        contentTextStyle: const TextStyle(color: MyColors.black),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: MyColors.grey,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: MyColors.lightGrey,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: MyColors.grey,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        hintStyle: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 14,
          color: MyColors.lightGrey,
        ),
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: MyColors.orange,
        selectionHandleColor: MyColors.orange,
        selectionColor: MyColors.orange.withOpacity(0.1),
      ),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData.dark();
  }
}
