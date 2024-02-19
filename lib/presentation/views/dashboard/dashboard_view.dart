import 'package:cuentas_app/common/widgets/widgets.dart';
import 'package:cuentas_app/config/constants/app_constants.dart';
import 'package:cuentas_app/config/theme/custom_theme_extension.dart';
import 'package:cuentas_app/presentation/widgets/dashboard/card_total_transaction_widget.dart';
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
          child: SingleChildScrollView(
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
                      child: CardTotalTransactionWidget(
                        isExpense: false,
                        total: 100000,
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: CardTotalTransactionWidget(
                        isExpense: true,
                        total: 100000,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: defaultSpacing),
                const BarChartWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
