import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rive/rive.dart';

class SplashscreenView extends StatelessWidget {
  static const name = "splashScreen";

  const SplashscreenView({super.key});

  @override
  Widget build(BuildContext context) {
    redirectTo(context);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: 160,
            height: 120,
            child: RiveAnimation.asset(
              Theme.of(context).brightness != Brightness.dark
                  ? 'assets/animations/logo_splash_intro_dark.riv'
                  : 'assets/animations/logo_splash_intro_light.riv',
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }

  void redirectTo(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 2500), () {
      context.go('/intro');
    });
  }
}
