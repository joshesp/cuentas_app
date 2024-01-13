import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:cuentas_app/config/constants/app_constants.dart';
import 'package:cuentas_app/config/theme/coolors.dart';

class SplashscreenView extends StatelessWidget {
  const SplashscreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Coolors.dark,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(defaultSpacing),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              // TODO: Add Rive component
              Center(
                child: SizedBox(
                  child: SvgPicture.asset(
                    'assets/images/cuentas_app_logotipo.svg',
                  ),
                ),
              ),
              const Spacer(),
              SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  backgroundColor: Coolors.light.withOpacity(0.5),
                  color: Coolors.primary,
                  strokeWidth: 2,
                ),
              ),
              const SizedBox(height: 14),
              Text(
                'Toma el control de tu contabilidad',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
