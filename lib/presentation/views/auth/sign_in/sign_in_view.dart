import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cuentas_app/config/constants/app_constants.dart';
import 'package:cuentas_app/config/theme/coolors.dart';
import 'package:cuentas_app/config/theme/custom_theme_extension.dart';
import 'package:cuentas_app/presentation/widgets/auth/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/widgets/widgets.dart';

class SignInView extends StatelessWidget {
  static const name = "signInScreen";

  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final sizeScreen = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          behavior: HitTestBehavior.opaque,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            reverse: true,
            child: Container(
              height: sizeScreen.height,
              padding: const EdgeInsets.all(maxSpacing),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  SvgPicture.asset(
                    'assets/images/cuentas-app-iso.svg',
                    height: 70,
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      context.theme.primaryColor!,
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(height: minSpacing),
                  DefaultTextStyle(
                    style: textTheme.titleLarge!,
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TyperAnimatedText(
                          '¡Bienvenido!',
                          speed: const Duration(milliseconds: 110),
                        ),
                      ],
                      isRepeatingAnimation: false,
                    ),
                  ),
                  const Spacer(),
                  const FormSignInWidget(),
                  const SizedBox(height: 24),
                  const AuthBySocialNetworkWidget(),
                  const Spacer(),
                  _createAccountWidget(context, textTheme)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _createAccountWidget(BuildContext context, TextTheme textTheme) {
    return Align(
      alignment: Alignment.center,
      child: TextLinkWidget(
        onPressed: () {
          context.go('/auth/register');
        },
        textLink: 'Crear cuenta',
        prefixText: '¿Aún no tienes una cuenta?\n',
        textLinkStyle: textTheme.bodyLarge!.copyWith(
          color: Coolors.accent,
          fontWeight: FontWeight.w600,
        ),
        textComplementStyle: textTheme.bodyLarge!.copyWith(
          color: context.theme.textBase,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
