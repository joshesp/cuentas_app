import 'package:cuentas_app/common/widgets/input_custom/input_custom_widget_widget.dart';
import 'package:cuentas_app/config/constants/app_constants.dart';
import 'package:cuentas_app/config/theme/text_style_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../common/utils/index.dart';
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
                  SvgPicture.asset('assets/images/cuentas_app_iso.svg'),
                  const SizedBox(height: minSpacing),
                  Text(
                    "Hola,\n¡Bienvenido!",
                    style: textTheme.titleLarge,
                  ),
                  const SizedBox(height: maxSpacing),
                  const Spacer(),
                  const _FormSignIn(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _FormSignIn extends StatefulWidget {
  const _FormSignIn();

  @override
  State<_FormSignIn> createState() => _FormSignInState();
}

class _FormSignInState extends State<_FormSignIn> {
  final _focusPasswordNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          InputCustomWidget(
            labelText: 'Correo electrónico',
            hintText: 'Ingresa tu correo electrónico',
            prefixIcon: Icons.alternate_email,
            keyboardType: TextInputType.emailAddress,
            focusNodeNext: _focusPasswordNode,
            validator: emailValidator,
          ),
          InputCustomWidget(
            labelText: 'Contraseña',
            hintText: 'Ingresa tu contraseña',
            prefixIcon: Icons.lock,
            focusNode: _focusPasswordNode,
            obscureText: true,
            validator: passwordValidator,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextLinkWidget(
              text: 'Olvidaste tu contraseña?',
              onPressed: () {
                _onShowModalBottomSheet(context);
              },
            ),
          ),
          const SizedBox(height: maxSpacing + minSpacing),
          ButtonAppWidget(
            text: 'Ingresar',
            icon: Icons.arrow_forward_ios,
            fullWidth: true,
            onPressed: onAuth,
          ),
          const SizedBox(height: minSpacing),
          ButtonAppWidget(
            text: 'Crear cuenta',
            fullWidth: true,
            styleType: ButtonStyleType.clear,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  void onAuth() {
    if (_formKey.currentState == null) return;

    final status = _formKey.currentState!.validate();

    if (status) {
      // TODO: Implementar lógica de inicio de sesión
    }
  }

  void _onShowModalBottomSheet(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    showModalBottomSheetCustom(
      context: context,
      contentWidgets: Column(
        children: [
          Text(
            'Recuperar contraseña',
            style: TextStyleTheme.subtitle.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: minSpacing),
          Text(
            'Ingresa tu correo y te enviaremos un link para que puedas restaurar tu contraseña.',
            style: textTheme.bodyLarge,
          ),
          const SizedBox(height: maxSpacing),
          const InputCustomWidget(
            labelText: 'Correo',
            hintText: 'Ingresa tu correo',
            prefixIcon: Icons.alternate_email,
          ),
        ],
      ),
      buttonActions: [
        ButtonAppWidget(
          text: 'Recuperar contraseña',
          fullWidth: true,
          onPressed: () {},
        ),
        ButtonAppWidget(
          text: 'Cancelar',
          fullWidth: true,
          styleType: ButtonStyleType.clear,
          onPressed: () {},
        ),
      ],
    );
  }
}
