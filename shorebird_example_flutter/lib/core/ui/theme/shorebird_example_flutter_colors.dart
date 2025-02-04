import 'package:flutter/material.dart';

abstract final class ShorebirdExampleFlutterColors {
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
    primary: ShorebirdExampleFlutterColors.black1,
    onPrimary: ShorebirdExampleFlutterColors.white1,
    secondary: ShorebirdExampleFlutterColors.black1,
    onSecondary: ShorebirdExampleFlutterColors.white1,
    surface: Colors.white,
    onSurface: ShorebirdExampleFlutterColors.black1,
    error: Colors.white,
    onError: Colors.red,
  );

  static const darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: ShorebirdExampleFlutterColors.white1,
    onPrimary: ShorebirdExampleFlutterColors.black1,
    secondary: ShorebirdExampleFlutterColors.white1,
    onSecondary: ShorebirdExampleFlutterColors.black1,
    surface: ShorebirdExampleFlutterColors.black1,
    onSurface: Colors.white,
    error: Colors.black,
    onError: ShorebirdExampleFlutterColors.red1,
  );
}
