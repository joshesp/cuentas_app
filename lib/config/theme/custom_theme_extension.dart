import 'package:flutter/material.dart';

import 'coolors.dart';

extension ExtendTheme on BuildContext {
  CustomThemeExtension get theme {
    return Theme.of(this).extension<CustomThemeExtension>()!;
  }
}

class CustomThemeExtension extends ThemeExtension<CustomThemeExtension> {
  final Color? backgroundColor;
  final Color? backgroundActiveBullet;
  final Color? textColor;
  final Color? textSecondary;
  final Color? textGray;
  final Color? textError;

  const CustomThemeExtension({
    this.backgroundColor,
    this.backgroundActiveBullet,
    this.textColor,
    this.textSecondary,
    this.textGray,
    this.textError,
  });

  static const lightMode = CustomThemeExtension(
    backgroundColor: Coolors.light,
    backgroundActiveBullet: Coolors.accent,
    textColor: Coolors.dark,
    textSecondary: Coolors.primary,
    textGray: Coolors.gray,
    textError: Coolors.danger,
  );

  static const darkMode = CustomThemeExtension(
    backgroundColor: Coolors.dark,
    backgroundActiveBullet: Coolors.accent,
    textColor: Colors.white,
    textSecondary: Coolors.light,
    textGray: Coolors.light,
    textError: Coolors.danger,
  );

  @override
  ThemeExtension<CustomThemeExtension> copyWith({
    Color? primaryColor,
    Color? accentColor,
    Color? backgroundColor,
    Color? backgroundActiveBullet,
    Color? textColor,
    Color? textSecondary,
    Color? textGray,
    Color? textError,
  }) {
    return CustomThemeExtension(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      backgroundActiveBullet:
          backgroundActiveBullet ?? this.backgroundActiveBullet,
      textColor: textColor ?? this.textColor,
      textSecondary: textColor ?? this.textSecondary,
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
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      backgroundActiveBullet: Color.lerp(
        backgroundActiveBullet,
        other.backgroundActiveBullet,
        t,
      ),
      textColor: Color.lerp(textColor, other.textColor, t),
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t),
      textGray: Color.lerp(textGray, other.textGray, t),
      textError: Color.lerp(textError, other.textError, t),
    );
  }
}
