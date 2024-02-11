import 'package:cuentas_app/config/constants/app_constants.dart';
import 'package:cuentas_app/config/theme/custom_theme_extension.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeText = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: maxSpacing),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Hola Jonh Smith!'),
              Icon(
                Icons.account_circle,
                size: 34,
                color: context.theme.primaryColor,
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(maxSpacing),
          child: Column(
            children: [
              Text('En este mes'),
              Text(
                'Tu balance',
                style: themeText.headlineLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
