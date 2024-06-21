
import 'package:flutter/material.dart';

import 'app_color.dart';

ThemeData lightTheme() {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColor.primary,
    ),
    scaffoldBackgroundColor: Colors.white,
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.neutral100,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
      shape: Border.symmetric(horizontal: BorderSide(width: 2, color: AppColor.neutral200)),
      // shape: Border.fromBorderSide(BorderSide(width: 2, color: AppColor.neutral200)),
      titleSpacing: 16,
      centerTitle: false,
      scrolledUnderElevation: 0,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColor.primary,
      foregroundColor: Colors.white,
      shape: CircleBorder(),
      elevation: 0,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.neutral200)
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
            color: AppColor.neutral200
        ),
      ),
      fillColor: Colors.white,
    ),
  );
}
