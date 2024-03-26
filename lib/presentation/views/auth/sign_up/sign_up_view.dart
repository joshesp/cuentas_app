import 'package:cuentas_app/common/utils/index.dart';
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
    final sizeScreen = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear cuenta'),
      ),
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
              height: sizeScreen.height - (maxSpacing * 2),
              padding: const EdgeInsets.all(maxSpacing),
              child: const Column(
                children: [
                  FormSignUpWidget(),
                  SizedBox(height: 24),
                  AuthBySocialNetworkWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FormSignUpWidget extends StatefulWidget {
  const FormSignUpWidget({super.key});

  @override
  State<FormSignUpWidget> createState() => _FormSignUpWidgetState();
}

class _FormSignUpWidgetState extends State<FormSignUpWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const InputCustomWidget(
          labelText: 'Nombre',
          hintText: 'Ingresa tu nombre',
          prefixIcon: Icons.person,
        ),
        const InputCustomWidget(
          labelText: 'Correo electrónico',
          hintText: 'Ingresa tu correo electrónico',
          prefixIcon: Icons.alternate_email,
          keyboardType: TextInputType.emailAddress,
          validator: emailValidator,
        ),
        const SizedBox(height: 8),
        const InputCustomWidget(
          labelText: 'Contraseña',
          hintText: 'Ingresa tu contraseña',
          prefixIcon: Icons.lock,
          obscureText: true,
          validator: passwordValidator,
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
              child: _createAccountWidget(context, Theme.of(context).textTheme),
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
      ],
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
