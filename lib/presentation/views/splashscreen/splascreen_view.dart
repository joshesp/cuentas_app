import 'package:cuentas_app/common/utils/fade_animation_util.dart';
import 'package:cuentas_app/config/constants/app_constants.dart';
import 'package:cuentas_app/config/theme/coolors.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

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
            children: [
              const Spacer(),
              const Center(
                child: SizedBox(
                  width: 160,
                  height: 160,
                  child: RiveAnimation.asset(
                    'assets/animations/logo-intro.riv',
                  ),
                ),
              ),
              const Spacer(),
              FadeAnimationUtil(
                duration: const Duration(milliseconds: 800),
                delay: const Duration(seconds: 2),
                child: Text(
                  'Toma el control de tu contabilidad',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Coolors.primary,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
