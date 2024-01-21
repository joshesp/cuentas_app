import 'package:cuentas_app/common/widgets/widgets.dart';
import 'package:cuentas_app/config/constants/app_constants.dart';
import 'package:cuentas_app/config/constants/texts_constants.dart';
import 'package:cuentas_app/config/theme/coolors.dart';
import 'package:flutter/material.dart';

class SlideIntroView extends StatelessWidget {
  const SlideIntroView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Coolors.light,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: maxSpacing,
            vertical: defaultSpacing,
          ),
          child: SliderWidget(
            sliderItems: sliderIntro,
            onActionEnd: () {},
          ),
        ),
      ),
    );
  }
}
