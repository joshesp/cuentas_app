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

  const CustomThemeExtension({
    this.primaryColor,
    this.accentColor,
    this.backgroundColor,
    this.textColor,
  });

  static const lightMode = CustomThemeExtension(
    primaryColor: Coolors.dark,
    accentColor: Coolors.accent,
    backgroundColor: Coolors.light,
    textColor: Coolors.dark,
  );

  static const darkMode = CustomThemeExtension(
    primaryColor: Coolors.light,
    accentColor: Coolors.accent,
    backgroundColor: Coolors.darker,
    textColor: Colors.white,
  );

  @override
  ThemeExtension<CustomThemeExtension> copyWith({
    Color? primaryColor,
    Color? accentColor,
    Color? backgroundColor,
    Color? textColor,
  }) {
    return CustomThemeExtension(
      primaryColor: primaryColor ?? this.primaryColor,
      accentColor: accentColor ?? this.accentColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textColor: textColor ?? this.textColor,
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
    );
  }
}
