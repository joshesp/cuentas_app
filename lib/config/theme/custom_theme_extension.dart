import 'package:flutter/material.dart';

import 'coolors.dart';

extension ExtendTheme on BuildContext {
  CustomThemeExtension get theme {
    return Theme.of(this).extension<CustomThemeExtension>()!;
  }
}

class CustomThemeExtension extends ThemeExtension<CustomThemeExtension> {
  final Color? primaryColor;
  final Color? accentColor;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? textGray;
  final Color? textError;

  const CustomThemeExtension({
    this.primaryColor,
    this.accentColor,
    this.backgroundColor,
    this.textColor,
    this.textGray,
    this.textError,
  });

  static const lightMode = CustomThemeExtension(
    primaryColor: Coolors.dark,
    accentColor: Coolors.accent,
    backgroundColor: Coolors.light,
    textColor: Coolors.dark,
    textGray: Coolors.gray,
    textError: Coolors.dangerDarker,
  );

  static const darkMode = CustomThemeExtension(
    primaryColor: Coolors.light,
    accentColor: Coolors.accent,
    backgroundColor: Coolors.darker,
    textColor: Colors.white,
    textGray: Coolors.grayLight,
    textError: Coolors.danger,
  );

  @override
  ThemeExtension<CustomThemeExtension> copyWith({
    Color? primaryColor,
    Color? accentColor,
    Color? backgroundColor,
    Color? textColor,
    Color? textGray,
    Color? textError,
  }) {
    return CustomThemeExtension(
      primaryColor: primaryColor ?? this.primaryColor,
      accentColor: accentColor ?? this.accentColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textColor: textColor ?? this.textColor,
      textGray: textGray ?? this.textGray,
      textError: textError ?? this.textError,
    );
  }

  @override
  ThemeExtension<CustomThemeExtension> lerp(
      ThemeExtension<CustomThemeExtension>? other, double t) {
    if (other is! CustomThemeExtension) {
      return this;
    }

    return CustomThemeExtension(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t),
      accentColor: Color.lerp(accentColor, other.accentColor, t),
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      textColor: Color.lerp(textColor, other.textColor, t),
      textGray: Color.lerp(textGray, other.textGray, t),
      textError: Color.lerp(textError, other.textError, t),
    );
  }
}
