import 'package:flutter/material.dart';

class AppColors {
  static Color brand = const Color.fromRGBO(105, 158, 107, 1);

  static Color info = const Color.fromRGBO(111, 137, 226, 1);
  static Color error = const Color.fromRGBO(229, 96, 96, 1);
  static Color warning = const Color.fromRGBO(234, 164, 83, 1);

  static Color inverse = const Color.fromRGBO(245, 245, 245, 1);
  static Color inverseMuted = const Color.fromRGBO(224, 224, 224, 1);

  static Color bold = const Color.fromRGBO(34, 29, 35, 1);
  static Color boldMuted = const Color.fromRGBO(54, 46, 56, 1);
}

ThemeData primaryTheme = ThemeData(
  // seed
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.brand),
  // scaffold
  scaffoldBackgroundColor: AppColors.inverse,
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.inverseMuted,
    foregroundColor: AppColors.brand,
    surfaceTintColor: Colors.transparent,
    centerTitle: true,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    foregroundColor: AppColors.inverse,
    backgroundColor: AppColors.brand,
    shape: const CircleBorder(),
  ),
);
