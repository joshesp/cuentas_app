import 'package:cuentas_app/config/theme/coolors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rive/rive.dart';

class SplashscreenView extends StatelessWidget {
  static const name = "splashScreen";

  const SplashscreenView({super.key});

  @override
  Widget build(BuildContext context) {
    redirectTo(context);

    return const Scaffold(
      backgroundColor: Coolors.dark,
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: 160,
            height: 120,
            child: RiveAnimation.asset(
              'assets/animations/logo_splash_intro.riv',
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }

  void redirectTo(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 2700), () {
      context.replace('/intro');
    });
  }
}
