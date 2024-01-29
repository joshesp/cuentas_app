import 'package:cuentas_app/config/theme/coolors.dart';
import 'package:cuentas_app/config/theme/custom_theme_extension.dart';
import 'package:flutter/material.dart';

import 'text_style_theme.dart';

ThemeData darkTheme() {
  final ThemeData base = ThemeData.dark();

  return base.copyWith(
    scaffoldBackgroundColor: Coolors.dark,
    extensions: [CustomThemeExtension.darkMode],
    textTheme: TextTheme(
      titleLarge: TextStyleTheme.titleLarge.copyWith(color: Colors.white),
      titleMedium: TextStyleTheme.titleMedium.copyWith(color: Colors.white),
      titleSmall: TextStyleTheme.titleSmall.copyWith(color: Colors.white),
      bodyLarge: TextStyleTheme.bodyLarge.copyWith(color: Colors.white),
      bodyMedium: TextStyleTheme.bodyMedium.copyWith(color: Colors.white),
      bodySmall: TextStyleTheme.bodySmall.copyWith(color: Colors.white),
    ).apply(
      displayColor: Coolors.light,
      bodyColor: Coolors.light,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Coolors.primaryDark,
        foregroundColor: Coolors.dark,
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
        foregroundColor: Colors.white,
        backgroundColor: Coolors.dark,
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
        foregroundColor: Coolors.light,
        disabledForegroundColor: Coolors.grayLight,
        disabledBackgroundColor: Colors.transparent,
        iconColor: Coolors.light,
        disabledIconColor: Coolors.grayLight,
        textStyle: TextStyleTheme.buttonMedium,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Coolors.accent,
      selectionColor: Coolors.accentLight,
      selectionHandleColor: Coolors.accentLight,
    ),
  );
}
