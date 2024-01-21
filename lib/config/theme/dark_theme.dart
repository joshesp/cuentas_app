import 'package:cuentas_app/config/theme/coolors.dart';
import 'package:flutter/material.dart';

import 'text_style_theme.dart';

ThemeData darkTheme() {
  final ThemeData base = ThemeData.dark();

  return base.copyWith(
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Coolors.dark,
    textTheme: TextTheme(
      titleLarge: TextStyleTheme.titleLarge.copyWith(color: Coolors.light),
      titleMedium: TextStyleTheme.titleMedium.copyWith(color: Coolors.light),
      titleSmall: TextStyleTheme.titleSmall.copyWith(color: Coolors.light),
      bodyLarge: TextStyleTheme.bodyLarge.copyWith(color: Coolors.light),
      bodyMedium: TextStyleTheme.bodyMedium.copyWith(color: Coolors.light),
      bodySmall: TextStyleTheme.bodySmall.copyWith(color: Coolors.light),
    ),
  );
}
