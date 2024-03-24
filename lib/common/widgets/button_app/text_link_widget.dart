import 'package:flutter/material.dart';

class TextLinkWidget extends StatelessWidget {
  final void Function()? onPressed;
  final String textLink;
  final String prefixText;
  final String sufixText;
  final TextAlign? textAlign;
  final TextStyle? textLinkStyle;
  final TextStyle? textComplmentStyle;

  const TextLinkWidget(
      {super.key,
      required this.onPressed,
      required this.textLink,
      this.prefixText = '',
      this.sufixText = '',
      this.textLinkStyle,
      this.textComplmentStyle,
      this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      textAlign: textAlign,
      TextSpan(
        text: '$prefixText ',
        children: [
          WidgetSpan(
            child: InkWell(
              onTap: onPressed,
              child: Text(
                textLink,
                style: textLinkStyle,
              ),
            ),
          ),
          TextSpan(
            text: ' $sufixText',
          ),
        ],
      ),
      style: textComplmentStyle,
    );
  }
}
