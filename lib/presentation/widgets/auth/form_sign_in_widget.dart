import 'package:cuentas_app/common/utils/validators_util.dart';
import 'package:cuentas_app/common/widgets/input_custom/input_custom_widget_widget.dart';
import 'package:cuentas_app/common/widgets/widgets.dart';
import 'package:cuentas_app/config/constants/app_constants.dart';
import 'package:cuentas_app/config/theme/custom_theme_extension.dart';
import 'package:cuentas_app/config/theme/text_style_theme.dart';
import 'package:flutter/material.dart';

class FormSignInWidget extends StatefulWidget {
  const FormSignInWidget({super.key});

  @override
  State<FormSignInWidget> createState() => _FormSignInState();
}

class _FormSignInState extends State<FormSignInWidget> {
  final _focusPasswordNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _focusPasswordNode.dispose();

    super.dispose();
  }

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
          const SizedBox(height: 4),
          InputCustomWidget(
            labelText: 'Contraseña',
            hintText: 'Ingresa tu contraseña',
            prefixIcon: Icons.lock,
            focusNode: _focusPasswordNode,
            isPassword: true,
            validator: passwordValidator,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextLinkWidget(
              textLink: '¿Olvidaste tu contraseña?',
              textLinkStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: context.theme.backgroundActiveBullet,
                  ),
              onPressed: () {
                _onShowModalBottomSheet(context);
              },
            ),
          ),
          const SizedBox(height: defaultSpacing),
          ButtonAppWidget(
            text: 'Ingresar',
            icon: Icons.arrow_forward_ios,
            fullWidth: true,
            onPressed: _onSignIn,
          ),
        ],
      ),
    );
  }

  void _onSignIn() {
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
          const SizedBox(height: defaultSpacing),
          Text(
            'Ingresa tu correo y te enviaremos un link para que puedas restaurar tu contraseña.',
            style: textTheme.bodyMedium,
          ),
          const SizedBox(height: maxSpacing),
          const InputCustomWidget(
            labelText: 'Correo electrónico',
            hintText: 'Ingresa tu correo electrónico',
            prefixIcon: Icons.alternate_email,
            keyboardType: TextInputType.emailAddress,
            validator: emailValidator,
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
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
