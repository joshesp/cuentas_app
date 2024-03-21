import 'package:cuentas_app/common/utils/fade_animation_util.dart';
import 'package:cuentas_app/config/constants/app_constants.dart';
import 'package:cuentas_app/config/theme/coolors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rive/rive.dart';

class SplashscreenView extends StatefulWidget {
  static const name = "splashScreen";

  const SplashscreenView({super.key});

  @override
  State<SplashscreenView> createState() => _SplashscreenViewState();
}

class _SplashscreenViewState extends State<SplashscreenView> {
  late StateMachineController _controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeEventListener(onRiveEvent);
    _controller.dispose();
    super.dispose();
  }

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
              Center(
                child: SizedBox(
                  width: 160,
                  height: 160,
                  child: RiveAnimation.asset(
                    'assets/animations/logo_splash_intro.riv',
                    onInit: onInit,
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

  void onInit(Artboard artboard) async {
    _controller = StateMachineController.fromArtboard(
      artboard,
      'State Machine 1',
    )!;
    artboard.addController(_controller);

    _controller.addEventListener(onRiveEvent);
  }

  void onRiveEvent(RiveEvent event) {
    if (event.name == 'initAnimation') {
      redirectTo();
    }
  }

  void redirectTo() {
    Future.delayed(const Duration(seconds: 2), () {
      context.go('/intro');
    });
  }
}
