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
  final _focusNamesNode = FocusNode();
  final _focusEmailNode = FocusNode();
  final _focusPasswordNode = FocusNode();
  final _focusConfirmPasswordNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _focusNamesNode.dispose();
    _focusEmailNode.dispose();
    _focusPasswordNode.dispose();
    _focusConfirmPasswordNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          InputCustomWidget(
            labelText: 'Nombre completo',
            hintText: 'Ingresa tu nombre',
            prefixIcon: Icons.person,
            focusNode: _focusNamesNode,
            focusNodeNext: _focusEmailNode,
            validator: fullNameValidator,
          ),
          const SizedBox(height: 4),
          InputCustomWidget(
            labelText: 'Correo electrónico',
            hintText: 'Ingresa tu correo electrónico',
            prefixIcon: Icons.alternate_email,
            keyboardType: TextInputType.emailAddress,
            focusNode: _focusEmailNode,
            focusNodeNext: _focusPasswordNode,
            validator: emailValidator,
          ),
          const SizedBox(height: 4),
          InputCustomWidget(
            labelText: 'Contraseña',
            hintText: 'Ingresa tu contraseña',
            prefixIcon: Icons.lock,
            obscureText: true,
            focusNode: _focusPasswordNode,
            focusNodeNext: _focusConfirmPasswordNode,
            validator: passwordValidator,
          ),
          const SizedBox(height: 4),
          InputCustomWidget(
            labelText: 'Confirmar contraseña',
            hintText: 'Ingresa tu contraseña',
            prefixIcon: Icons.lock,
            suffixIcon: Icons.visibility,
            focusNode: _focusConfirmPasswordNode,
            validator: (String? value) => confirmPasswordValidator(value, ''),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Checkbox(
                value: false,
                onChanged: (value) {},
              ),
              Expanded(
                child:
                    _createAccountWidget(context, Theme.of(context).textTheme),
              ),
            ],
          ),
          const SizedBox(height: 18),
          ButtonAppWidget(
            text: 'Crear cuenta',
            icon: Icons.arrow_forward_ios,
            fullWidth: true,
            onPressed: _onSignUp,
          ),
        ],
      ),
    );
  }

  void _onSignUp() {
    if (_formKey.currentState == null) return;

    final status = _formKey.currentState!.validate();

    if (status) {
      // TODO: Implementar lógica de inicio de sesión
    }
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
