import 'package:flutter/material.dart';
import 'package:cuentas_app/config/theme/coolors.dart';

ThemeData lightTheme() {
  final ThemeData base = ThemeData.dark();

  return base.copyWith(
    primaryColor: Coolors.primary,
    scaffoldBackgroundColor: Colors.white,
  );
}
