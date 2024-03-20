import 'package:cuentas_app/common/widgets/button_app/button_app_widget.dart';
import 'package:cuentas_app/common/widgets/input_custom/input_custom_widget_widget.dart';
import 'package:cuentas_app/config/constants/app_constants.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  static const name = "signUpScreen";

  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;

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
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (value) {},
                  ),
                  SizedBox(
                    width: widthScreen * 0.7,
                    child: Text.rich(
                      TextSpan(
                        text: 'He leido y acepto los ',
                        children: [
                          TextSpan(
                            text: 'términos y condiciones',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontWeight: FontWeight.w700,
                                  decoration: TextDecoration.underline,
                                ),
                          ),
                          const TextSpan(text: ' del uso de la aplicación.')
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const Spacer(),
              ButtonAppWidget(
                text: 'Crear cuenta',
                icon: Icons.arrow_forward_ios,
                fullWidth: true,
                onPressed: () {},
              ),
              const SizedBox(height: minSpacing),
              ButtonAppWidget(
                text: 'Ya tengo una cuenta',
                fullWidth: true,
                styleType: ButtonStyleType.clear,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
