import 'package:flutter/material.dart';

class AppTheme {
  static const Color orangeColor = Color(0xFFCF764C);
  static const Color navyBlueColor = Color(0xFF2C4F6B);
  static const Color lightNavyBlueColor = Color(0x802C4F6B);
  static const Color camelColor = Color(0xFFE9B167);
  static const Color maroonColor = Color(0xFF923933);
  static const Color whiteColor = Colors.white;
  static const Color blackColor = Colors.black;
  static const Color greyColor = Colors.grey;

  static ThemeData buildTheme() {
    final baseData = ThemeData.light();

    return baseData.copyWith(
      primaryColor: orangeColor,
      backgroundColor: whiteColor,
      scaffoldBackgroundColor: whiteColor,
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: navyBlueColor),
    );
  }
}
