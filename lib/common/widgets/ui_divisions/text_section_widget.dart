import 'package:cuentas_app/common/utils/screen_size_util.dart';
import 'package:cuentas_app/config/constants/app_constants.dart';
import 'package:cuentas_app/config/theme/custom_theme_extension.dart';
import 'package:flutter/material.dart';

class TextSection extends StatelessWidget {
  final String title;
  final String subtitle;

  const TextSection({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    ScreenSizeUtil.init(context);

    final themeText = Theme.of(context).textTheme;
    double bodyLarge = ScreenSizeUtil.getScaledSize(bodySize);
    double healineLarge = ScreenSizeUtil.getScaledSize(titleLargeSize);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          subtitle,
          style: themeText.bodyLarge!.copyWith(fontSize: bodyLarge),
        ),
        Text(
          title,
          style: themeText.headlineLarge!.copyWith(
            color: context.theme.primaryColor,
            fontSize: healineLarge,
          ),
        ),
      ],
    );
  }
}
