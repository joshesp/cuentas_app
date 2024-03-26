import 'package:cuentas_app/common/widgets/button_app/button_app_widget.dart';
import 'package:cuentas_app/common/widgets/button_app/text_link_widget.dart';
import 'package:cuentas_app/common/widgets/input_custom/input_custom_widget_widget.dart';
import 'package:cuentas_app/config/constants/app_constants.dart';
import 'package:cuentas_app/config/theme/coolors.dart';
import 'package:cuentas_app/config/theme/custom_theme_extension.dart';
import 'package:cuentas_app/presentation/widgets/auth/index.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  static const name = "signUpScreen";

  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear cuenta'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(maxSpacing),
          child: Column(
            children: [
              const InputCustomWidget(
                labelText: 'Nombre',
                hintText: 'Ingresa tu nombre',
                prefixIcon: Icons.person,
              ),
              const InputCustomWidget(
                labelText: 'Correo',
                hintText: 'Ingresa tu correo',
                prefixIcon: Icons.alternate_email,
              ),
              const InputCustomWidget(
                labelText: 'Contraseña',
                hintText: 'Ingresa tu contraseña',
                prefixIcon: Icons.lock,
              ),
              const InputCustomWidget(
                labelText: 'Confirmar contraseña',
                hintText: 'Ingresa tu contraseña',
                prefixIcon: Icons.lock,
                suffixIcon: Icons.visibility,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (value) {},
                  ),
                  Expanded(
                    child: _createAccountWidget(
                        context, Theme.of(context).textTheme),
                  ),
                ],
              ),
              const SizedBox(height: defaultSpacing),
              ButtonAppWidget(
                text: 'Crear cuenta',
                icon: Icons.arrow_forward_ios,
                fullWidth: true,
                onPressed: () {},
              ),
              const SizedBox(height: 24),
              const AuthBySocialNetworkWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _createAccountWidget(BuildContext context, TextTheme textTheme) {
    return TextLinkWidget(
      onPressed: () {},
      textLink: 'términos y condiciones',
      textLinkStyle: textTheme.bodySmall!.copyWith(
        color: Coolors.accent,
        fontWeight: FontWeight.w700,
      ),
      prefixText: 'He leido y acepto los',
      sufixText: 'del uso de la aplicación.',
      textComplementStyle: textTheme.bodySmall!.copyWith(
        color: context.theme.textBase,
      ),
      textAlign: TextAlign.left,
    );
  }
}
