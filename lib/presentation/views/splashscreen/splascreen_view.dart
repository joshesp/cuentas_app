import 'dart:async';

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
              FadeAnimationWidget(
                duration: const Duration(milliseconds: 800),
                delay: const Duration(seconds: 2),
                fadeOutAction: false,
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

class FadeAnimationWidget extends StatefulWidget {
  final Widget child;
  final bool fadeOutAction;
  final Duration duration;
  final Duration delay;

  const FadeAnimationWidget({
    super.key,
    required this.child,
    required this.duration,
    this.fadeOutAction = true,
    this.delay = const Duration(milliseconds: 0),
  });

  @override
  State<FadeAnimationWidget> createState() => _FadeAnimationWidgetState();
}

class _FadeAnimationWidgetState extends State<FadeAnimationWidget> {
  bool _visible = true;

  @override
  void initState() {
    super.initState();

    setState(() {
      _visible = widget.fadeOutAction;
    });

    Timer(widget.delay, () {
      setState(() {
        _visible = !_visible;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _visible ? 1.0 : 0.0,
      duration: widget.duration,
      child: widget.child,
    );
  }
}
