import 'package:cuentas_app/config/theme/coolors.dart';
import 'package:flutter/material.dart';

import 'button_style_theme.dart';
import 'text_style_theme.dart';

ThemeData lightTheme() {
  final ThemeData base = ThemeData.dark();

  return base.copyWith(
    primaryColor: Coolors.dark,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme(
      titleLarge: TextStyleTheme.titleLarge.copyWith(color: Coolors.dark),
      titleMedium: TextStyleTheme.titleMedium.copyWith(color: Coolors.dark),
      titleSmall: TextStyleTheme.titleSmall.copyWith(color: Coolors.dark),
      bodyLarge: TextStyleTheme.bodyLarge.copyWith(color: Coolors.dark),
      bodyMedium: TextStyleTheme.bodyMedium.copyWith(color: Coolors.dark),
      bodySmall: TextStyleTheme.bodySmall.copyWith(color: Coolors.dark),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: elevatedBtnStyle,
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: outlinedBtnStyle,
    ),
    textButtonTheme: TextButtonThemeData(
      style: textBtnStyle,
    ),
  );
}
