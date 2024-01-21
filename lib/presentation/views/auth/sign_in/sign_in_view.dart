import 'package:cuentas_app/config/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
            children: [
              SvgPicture.asset('assets/images/cuentas_app_iso.svg'),
              Text(
                "Hola,\n¡Bienvenido!",
                style: textTheme.titleLarge,
              ),
              const TextField(
                decoration: InputDecoration(
                    hintText: 'Enter a search term',
                    border: UnderlineInputBorder()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
