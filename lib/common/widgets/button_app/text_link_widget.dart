import 'package:cuentas_app/config/theme/custom_theme_extension.dart';
import 'package:flutter/material.dart';

class TextLinkWidget extends StatelessWidget {
  final void Function()? onPressed;
  final String textLink;
  final String prefixText;
  final String sufixText;
  final bool isBoldTextLink;
  final Color? colorTextLink;
  final Color? colorOtherText;

  const TextLinkWidget({
    super.key,
    required this.onPressed,
    required this.textLink,
    this.prefixText = '',
    this.sufixText = '',
    this.colorTextLink,
    this.colorOtherText,
    this.isBoldTextLink = false,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Text.rich(
      TextSpan(
        text: '$prefixText ',
        children: [
          WidgetSpan(
            child: InkWell(
              onTap: onPressed,
              child: Text(
                textLink,
                style: textTheme.bodyMedium!.copyWith(
                  fontWeight:
                      isBoldTextLink ? FontWeight.w600 : FontWeight.normal,
                  color: colorTextLink ?? context.theme.textColor,
                ),
              ),
            ),
          ),
          TextSpan(
            text: ' $sufixText',
          ),
        ],
      ),
      style: textTheme.bodyMedium!.copyWith(
        color: colorOtherText ?? context.theme.textColor,
      ),
    );
  }
}
