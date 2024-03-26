import 'package:cuentas_app/common/utils/screen_size_util.dart';
import 'package:cuentas_app/config/constants/app_constants.dart';
import 'package:cuentas_app/config/theme/custom_theme_extension.dart';
import 'package:flutter/material.dart';

class TextSection extends StatelessWidget {
  final String headline1;
  final String headline2;
  final String subtitle;

  const TextSection({
    super.key,
    this.headline1 = '',
    this.headline2 = '',
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    ScreenSizeUtil.init(context);

    final themeText = Theme.of(context).textTheme;
    double bodyLarge = ScreenSizeUtil.getScaledSize(bodySize);
    double healineLarge = ScreenSizeUtil.getScaledSize(titleLargeSize);
    double healineMedium = ScreenSizeUtil.getScaledSize(titleMediumSize);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          subtitle,
          style: themeText.bodyLarge!.copyWith(fontSize: bodyLarge),
        ),
        if (headline1.isNotEmpty)
          Text(
            headline1,
            style: themeText.titleLarge!.copyWith(
              color: context.theme.textBase,
              fontSize: healineLarge,
            ),
          ),
        if (headline1.isEmpty && headline2.isNotEmpty)
          Text(
            headline2,
            style: themeText.titleMedium!.copyWith(
              color: context.theme.textBase,
              fontSize: healineMedium,
            ),
          ),
      ],
    );
  }
}
