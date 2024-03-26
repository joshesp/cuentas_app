import 'package:flutter/material.dart';

import 'coolors.dart';

extension ExtendTheme on BuildContext {
  CustomThemeExtension get theme {
    return Theme.of(this).extension<CustomThemeExtension>()!;
  }
}

class CustomThemeExtension extends ThemeExtension<CustomThemeExtension> {
  final Color? backgroundColor;
  final Color? primaryColor;
  final Color? backgroundActiveBullet;
  final Color? textBase;
  final Color? textGray;
  final Color? textError;

  const CustomThemeExtension({
    this.backgroundColor,
    this.primaryColor,
    this.backgroundActiveBullet,
    this.textBase,
    this.textGray,
    this.textError,
  });

  static const lightMode = CustomThemeExtension(
    backgroundColor: Coolors.light,
    backgroundActiveBullet: Coolors.dark,
    primaryColor: Coolors.primary,
    textBase: Coolors.dark,
    textGray: Coolors.gray,
    textError: Coolors.danger,
  );

  static const darkMode = CustomThemeExtension(
    backgroundColor: Coolors.dark,
    backgroundActiveBullet: Colors.white,
    primaryColor: Coolors.light,
    textBase: Colors.white,
    textGray: Coolors.light,
    textError: Coolors.danger,
  );

  @override
  ThemeExtension<CustomThemeExtension> copyWith({
    Color? backgroundColor,
    Color? backgroundActiveBullet,
    Color? primaryColor,
    Color? textBase,
    Color? textGray,
    Color? textError,
  }) {
    return CustomThemeExtension(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      backgroundActiveBullet:
          backgroundActiveBullet ?? this.backgroundActiveBullet,
      primaryColor: primaryColor ?? this.primaryColor,
      textBase: textBase ?? this.textBase,
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
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t),
      textBase: Color.lerp(textBase, other.textBase, t),
      textGray: Color.lerp(textGray, other.textGray, t),
      textError: Color.lerp(textError, other.textError, t),
    );
  }
}
