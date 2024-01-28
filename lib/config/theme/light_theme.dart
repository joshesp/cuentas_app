import 'package:cuentas_app/config/theme/coolors.dart';
import 'package:flutter/material.dart';

import 'custom_theme_extension.dart';
import 'text_style_theme.dart';

ThemeData lightTheme() {
  final ThemeData base = ThemeData.dark();

  return base.copyWith(
    scaffoldBackgroundColor: Coolors.light,
    extensions: [CustomThemeExtension.lightMode],
    textTheme: TextTheme(
      titleLarge: TextStyleTheme.titleLarge.copyWith(color: Coolors.dark),
      titleMedium: TextStyleTheme.titleMedium.copyWith(color: Coolors.dark),
      titleSmall: TextStyleTheme.titleSmall.copyWith(color: Coolors.dark),
      bodyLarge: TextStyleTheme.bodyLarge.copyWith(color: Coolors.dark),
      bodyMedium: TextStyleTheme.bodyMedium.copyWith(color: Coolors.dark),
      bodySmall: TextStyleTheme.bodySmall.copyWith(color: Coolors.dark),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Coolors.dark,
        foregroundColor: Colors.white,
        disabledBackgroundColor: Coolors.grayLight,
        disabledForegroundColor: Coolors.gray,
        textStyle: TextStyleTheme.buttonMedium,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        shadowColor: const Color(0xCCD7D7D7),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Coolors.dark,
        disabledForegroundColor: Coolors.gray,
        disabledBackgroundColor: Coolors.grayLight,
        textStyle: TextStyleTheme.buttonMedium,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        side: const BorderSide(
          color: Coolors.dark,
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Coolors.dark,
        disabledForegroundColor: Coolors.grayLight,
        disabledBackgroundColor: Colors.transparent,
        iconColor: Coolors.dark,
        disabledIconColor: Coolors.grayLight,
        textStyle: TextStyleTheme.buttonMedium,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      ),
    ),
  );
}
