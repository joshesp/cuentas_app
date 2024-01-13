import 'package:flutter/material.dart';
import 'package:cuentas_app/config/constants/app_constants.dart';

class TextStyleTheme {
  TextStyleTheme._();

  static const titleLarge = TextStyle(
    fontFamily: fontPrimary,
    fontSize: 28,
    fontWeight: FontWeight.w700,
  );

  static const titleMedium = TextStyle(
    fontFamily: fontPrimary,
    fontSize: 26,
    fontWeight: FontWeight.w500,
  );

  static const titleSmall = TextStyle(
    fontFamily: fontPrimary,
    fontSize: 24,
    fontWeight: FontWeight.w500,
  );

  static const subtitle = TextStyle(
    fontFamily: fontPrimary,
    fontSize: 18,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
  );

  static const bodyLarge = TextStyle(
    fontFamily: fontPrimary,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
  );

  static const bodyMedium = TextStyle(
    fontFamily: fontPrimary,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.25,
  );

  static const bodySmall = TextStyle(
    fontFamily: fontPrimary,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.30,
  );

  static const captionMedium = TextStyle(
    fontSize: 10,
    fontFamily: fontPrimary,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.4,
  );

  static const captionSmall = TextStyle(
    fontSize: 8,
    fontFamily: fontPrimary,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
  );

  static const buttonMedium = TextStyle(
    fontSize: 14,
    fontFamily: fontPrimary,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.25,
  );

  static const buttonSmall = TextStyle(
    fontSize: 12,
    fontFamily: fontPrimary,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.25,
  );
}
