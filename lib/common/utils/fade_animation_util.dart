import 'dart:async';

import 'package:flutter/material.dart';

enum TypeAnimationAction { fadeIn, fadeOut }

class FadeAnimationUtil extends StatefulWidget {
  final Widget child;
  final TypeAnimationAction fadeType;
  final Duration duration;
  final Duration? delay;

  const FadeAnimationUtil({
    super.key,
    required this.child,
    required this.duration,
    this.fadeType = TypeAnimationAction.fadeIn,
    this.delay,
  });

  @override
  State<FadeAnimationUtil> createState() => _FadeAnimationUtilState();
}

class _FadeAnimationUtilState extends State<FadeAnimationUtil> {
  bool _visible = false;

  @override
  void initState() {
    super.initState();

    setState(() {
      _visible = widget.fadeType == TypeAnimationAction.fadeOut;
    });

    if (widget.delay != null) {
      Timer(widget.delay!, () {
        setState(() {
          _visible = !_visible;
        });
      });
    }
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
