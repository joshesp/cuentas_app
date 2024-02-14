import 'package:cuentas_app/config/constants/app_constants.dart';
import 'package:cuentas_app/config/theme/coolors.dart';
import 'package:cuentas_app/config/theme/custom_theme_extension.dart';
import 'package:cuentas_app/config/theme/text_style_theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'En este mes',
                style: themeText.bodyLarge,
              ),
              Text(
                'Tu balance',
                style: themeText.headlineLarge!.copyWith(
                  color: context.theme.primaryColor,
                ),
              ),
              const SizedBox(height: defaultSpacing),
              const Row(
                children: [
                  Expanded(
                    child: _CardTotalTransaction(
                      isExpense: false,
                      total: 100000,
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: _CardTotalTransaction(
                      isExpense: true,
                      total: 100000,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _CardTotalTransaction extends StatelessWidget {
  final bool isExpense;
  final double total;

  const _CardTotalTransaction({
    required this.isExpense,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat.simpleCurrency();

    return Container(
      padding: const EdgeInsets.all(minSpacing),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(minSpacing),
        border: Border.all(
          color: isExpense ? Coolors.danger : Coolors.primaryDark,
          width: 2,
        ),
      ),
      child: Column(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: isExpense ? Coolors.dangerLight : Coolors.primary,
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Icon(
                isExpense ? Icons.south_outlined : Icons.north_outlined,
                color: isExpense ? Coolors.dangerStrong : Coolors.primaryDark,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            (isExpense ? 'Gasto' : 'Ingreso').toUpperCase(),
            style: TextStyleTheme.captionMedium.copyWith(
              color: context.theme.textGray,
            ),
          ),
          const SizedBox(height: 8),
          FittedBox(
            child: Text(
              formatter.format(total),
              style: TextStyleTheme.titleSmall.copyWith(
                color: context.theme.primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
