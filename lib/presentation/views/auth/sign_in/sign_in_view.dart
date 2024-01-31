import 'package:cuentas_app/common/widgets/input_custom/input_custom_widget_widget.dart';
import 'package:cuentas_app/config/constants/app_constants.dart';
import 'package:cuentas_app/config/theme/text_style_theme.dart';
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
                  onTap: () {
                    _onShowModalBottomSheet(context);
                  },
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
