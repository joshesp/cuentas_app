import 'package:cuentas_app/common/widgets/input_custom/input_custom_widget_widget.dart';
import 'package:cuentas_app/config/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../common/widgets/widgets.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Padding(
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
              const Spacer(),
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
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
                    child: Text(
                      'Olvidaste tu contraseña?',
                      style: textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              ButtonAppWidget(
                text: 'Ingresar',
                icon: Icons.arrow_forward_ios,
                fullWidth: true,
                onPressed: () {},
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
        ),
      ),
    );
  }
}
