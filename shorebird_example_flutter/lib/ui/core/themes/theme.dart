import 'package:flutter/material.dart';
import 'package:shorebird_example_flutter/ui/core/themes/colors.dart';

abstract final class AppTheme {
  static const _textTheme = TextTheme(
    headlineLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w500,
    ),
    headlineSmall: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
    ),
    titleMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
    bodyLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    bodySmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.grey3,
    ),
    labelSmall: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color: AppColors.grey3,
    ),
    labelLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: AppColors.grey3,
    ),
  );

  static const _inputDecorationTheme = InputDecorationTheme(
    hintStyle: TextStyle(
      // grey3 works for both light and dark themes
      color: AppColors.grey3,
      fontSize: 18,
      fontWeight: FontWeight.w400,
    ),
    // labelStyle: TextStyle(
    //   color: AppColors.grey3,
    // ),
    // border: OutlineInputBorder(
    //   borderSide: BorderSide(
    //     color: AppColors.red1,
    //   ),
    // ),
    // errorStyle: TextStyle(
    //   color: AppColors.red1,
    // ),
    // errorBorder: UnderlineInputBorder(
    //   borderSide: BorderSide(
    //     color: AppColors.red1,
    //   ),
    // ),
  );

  static const _elevatedButtonTheme = ElevatedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStatePropertyAll<Color>(AppColors.white1),
      backgroundColor: WidgetStatePropertyAll<Color>(AppColors.orange),
    ),
  );

  static const _sliderThemeData = SliderThemeData(
    // valueIndicatorColor: Colors.white,
    valueIndicatorTextStyle: TextStyle(
      color: Colors.white,
    ),
  );

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: AppColors.lightColorScheme,
    textTheme: _textTheme,
    inputDecorationTheme: _inputDecorationTheme,
    elevatedButtonTheme: _elevatedButtonTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: AppColors.darkColorScheme,
    textTheme: _textTheme,
    inputDecorationTheme: _inputDecorationTheme,
    elevatedButtonTheme: _elevatedButtonTheme,
    sliderTheme: _sliderThemeData,
  );
}
