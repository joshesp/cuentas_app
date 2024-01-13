import 'package:flutter/material.dart';
import 'package:cuentas_app/config/theme/coolors.dart';

ThemeData darkTheme() {
  final ThemeData base = ThemeData.dark();

  return base.copyWith(
    primaryColor: Coolors.light,
    scaffoldBackgroundColor: Coolors.dark,
  );
}
