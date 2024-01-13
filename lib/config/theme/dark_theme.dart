import 'package:flutter/material.dart';
import 'package:cuentas_app/config/theme/coolors.dart';

import 'text_style_theme.dart';

ThemeData darkTheme() {
  final ThemeData base = ThemeData.dark();

  return base.copyWith(
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Coolors.dark,
    textTheme: const TextTheme(
      titleLarge: TextStyleTheme.titleLarge,
      titleMedium: TextStyleTheme.titleMedium,
      titleSmall: TextStyleTheme.titleSmall,
      bodyLarge: TextStyleTheme.bodyLarge,
      bodyMedium: TextStyleTheme.bodyMedium,
      bodySmall: TextStyleTheme.bodySmall,
    ),
  );
}
