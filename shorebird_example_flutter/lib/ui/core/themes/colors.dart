import 'package:flutter/material.dart';

abstract final class AppColors {
  static const orange = Colors.orange;
  static const black1 = Color(0xFF101010);
  static const white1 = Color(0xFFFFF7FA);
  static const grey1 = Color(0xFFF2F2F2);
  static const grey2 = Color(0xFF4D4D4D);
  static const grey3 = Color(0xFFA4A4A4);
  static const whiteTransparent =
      Color(0x4DFFFFFF); // Figma rgba(255, 255, 255, 0.3)
  static const blackTransparent = Color(0x4D000000);
  static const red1 = Color(0xFFE74C3C);

  static const lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.orange,
    onPrimary: AppColors.white1,
    secondary: AppColors.orange,
    onSecondary: AppColors.white1,
    surface: AppColors.white1,
    onSurface: AppColors.black1,
    error: Colors.red,
    onError: Colors.white,
  );

  static const darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.orange,
    onPrimary: AppColors.white1,
    secondary: AppColors.orange,
    onSecondary: AppColors.white1,
    surface: AppColors.black1,
    onSurface: AppColors.white1,
    error: AppColors.red1,
    onError: Colors.black,
  );
}
