import 'package:cuentas_app/config/constants/app_constants.dart';
import 'package:flutter/material.dart';

class TextStyleTheme {
  TextStyleTheme._();

  static const titleLarge = TextStyle(
    fontFamily: fontPrimary,
    fontSize: titleLargeSize,
    fontWeight: FontWeight.w600,
  );

  static const titleMedium = TextStyle(
    fontFamily: fontPrimary,
    fontSize: titleMediumSize,
    fontWeight: FontWeight.w600,
  );

  static const titleSmall = TextStyle(
    fontFamily: fontPrimary,
    fontSize: titleSmallSize,
    fontWeight: FontWeight.w600,
  );

  static const subtitle = TextStyle(
    fontFamily: fontPrimary,
    fontSize: subtitleSize,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
  );

  static const bodyLarge = TextStyle(
    fontFamily: fontPrimary,
    fontSize: bodySize,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
  );

  static const bodyMedium = TextStyle(
    fontFamily: fontPrimary,
    fontSize: bodyMediumSize,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.25,
  );

  static const bodySmall = TextStyle(
    fontFamily: fontPrimary,
    fontSize: bodySmallSize,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.30,
  );

  static const captionMedium = TextStyle(
    fontSize: captionSize,
    fontFamily: fontPrimary,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.4,
  );

  static const captionSmall = TextStyle(
    fontSize: captionSmallSize,
    fontFamily: fontPrimary,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
  );

  static const buttonMedium = TextStyle(
    fontSize: bodySize,
    fontFamily: fontPrimary,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.25,
    backgroundColor: Colors.transparent,
    wordSpacing: 1.25,
    decorationColor: Colors.transparent,
    decorationThickness: 0,
  );

  static const buttonSmall = TextStyle(
    fontSize: bodySmallSize,
    fontFamily: fontPrimary,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.25,
    backgroundColor: Colors.transparent,
    wordSpacing: 1.25,
    decorationColor: Colors.transparent,
    decorationThickness: 0,
  );

  static const inputLabel = TextStyle(
    fontSize: bodySmallSize,
    fontFamily: fontPrimary,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
  );

  static const bodyHintText = TextStyle(
    fontFamily: fontPrimary,
    fontSize: bodySize,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
  );
}
