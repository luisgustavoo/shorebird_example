import 'package:flutter/material.dart';
import 'package:shorebird_example_flutter/core/ui/theme/shorebird_example_flutter_colors.dart';

abstract final class ShorebirdExampleFlutterTheme {
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
      color: ShorebirdExampleFlutterColors.grey3,
    ),
    labelSmall: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color: ShorebirdExampleFlutterColors.grey3,
    ),
    labelLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: ShorebirdExampleFlutterColors.grey3,
    ),
  );

  static const _inputDecorationTheme = InputDecorationTheme(
    hintStyle: TextStyle(
      // grey3 works for both light and dark themes
      color: ShorebirdExampleFlutterColors.grey3,
      fontSize: 18,
      fontWeight: FontWeight.w400,
    ),
  );

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ShorebirdExampleFlutterColors.lightColorScheme,
    textTheme: _textTheme,
    inputDecorationTheme: _inputDecorationTheme,
    extensions: [
      _TagChipTheme(
        chipColor: ShorebirdExampleFlutterColors.whiteTransparent,
        onChipColor: Colors.white,
      ),
    ],
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ShorebirdExampleFlutterColors.darkColorScheme,
    textTheme: _textTheme,
    inputDecorationTheme: _inputDecorationTheme,
    extensions: [
      _TagChipTheme(
        chipColor: ShorebirdExampleFlutterColors.blackTransparent,
        onChipColor: Colors.white,
      ),
    ],
  );
}

class _TagChipTheme extends ThemeExtension<_TagChipTheme> {
  _TagChipTheme({
    required this.chipColor,
    required this.onChipColor,
  });

  final Color chipColor;
  final Color onChipColor;

  @override
  ThemeExtension<_TagChipTheme> copyWith({
    Color? chipColor,
    Color? onChipColor,
  }) {
    return _TagChipTheme(
      chipColor: chipColor ?? this.chipColor,
      onChipColor: onChipColor ?? this.onChipColor,
    );
  }

  @override
  ThemeExtension<_TagChipTheme> lerp(
    covariant ThemeExtension<_TagChipTheme> other,
    double t,
  ) {
    if (other is! _TagChipTheme) {
      return this;
    }
    return _TagChipTheme(
      chipColor: Color.lerp(chipColor, other.chipColor, t) ?? chipColor,
      onChipColor: Color.lerp(onChipColor, other.onChipColor, t) ?? onChipColor,
    );
  }
}
