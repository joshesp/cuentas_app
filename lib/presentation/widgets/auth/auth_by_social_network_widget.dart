import 'package:cuentas_app/config/theme/coolors.dart';
import 'package:cuentas_app/config/theme/custom_theme_extension.dart';
import 'package:cuentas_app/presentation/widgets/auth/button_social_widget.dart';
import 'package:flutter/material.dart';

class AuthBySocialNetworkWidget extends StatelessWidget {
  const AuthBySocialNetworkWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _lineWidget,
            const SizedBox(width: 8),
            Text(
              'O',
              style: textTheme.bodyLarge!.copyWith(
                color: context.theme.textGray,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 8),
            _lineWidget,
          ],
        ),
        const SizedBox(height: 24),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ButtonSocialWidget(
              type: TypeButtonSocial.apple,
            ),
            ButtonSocialWidget(
              type: TypeButtonSocial.google,
            ),
            ButtonSocialWidget(
              type: TypeButtonSocial.facebook,
            ),
            ButtonSocialWidget(
              type: TypeButtonSocial.twitter,
            ),
          ],
        ),
      ],
    );
  }

  Widget get _lineWidget => const SizedBox(
        width: 32,
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Coolors.gray,
                width: 1.5,
              ),
            ),
          ),
        ),
      );
}
