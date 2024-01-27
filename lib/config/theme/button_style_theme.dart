import 'package:cuentas_app/config/theme/coolors.dart';
import 'package:cuentas_app/config/theme/text_style_theme.dart';
import 'package:flutter/material.dart';

final ButtonStyle elevatedBtnStyle = ElevatedButton.styleFrom(
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
);

final ButtonStyle outlinedBtnStyle = OutlinedButton.styleFrom(
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
);

final ButtonStyle textBtnStyle = TextButton.styleFrom(
  foregroundColor: Coolors.dark,
  disabledForegroundColor: Coolors.grayLight,
  disabledBackgroundColor: Colors.transparent,
  iconColor: Coolors.dark,
  disabledIconColor: Coolors.grayLight,
  textStyle: TextStyleTheme.buttonMedium,
  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
);
