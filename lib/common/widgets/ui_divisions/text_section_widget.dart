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
    final themeText = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          subtitle,
          style: themeText.bodyLarge,
        ),
        Text(
          title,
          style: themeText.headlineLarge!.copyWith(
            color: context.theme.primaryColor,
          ),
        ),
      ],
    );
  }
}
