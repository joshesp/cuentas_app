import 'package:cuentas_app/common/widgets/widgets.dart';
import 'package:cuentas_app/config/constants/app_constants.dart';
import 'package:cuentas_app/config/theme/custom_theme_extension.dart';
import 'package:cuentas_app/presentation/widgets/dashboard/card_total_transaction_widget.dart';
import 'package:flutter/material.dart';

import '../../widgets/dashboard/item_transaction_widget.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
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
                const TextSection(
                  subtitle: 'En este mes',
                  title: 'Tu balance',
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
                const BarChartWidget(),
                const SizedBox(height: maxSpacing),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const TextSection(
                      subtitle: 'Últimas',
                      title: 'Transacciones',
                    ),
                    const SizedBox(width: 8),
                    TextLinkWidget(
                      text: 'Ver todas',
                      onPressed: () {},
                    )
                  ],
                ),
                const SizedBox(height: defaultSpacing),
                ItemTrasactionWidget(
                  concept: 'Pago de servicios',
                  amount: 1000,
                  isExpense: true,
                  date: DateTime.now(),
                ),
                const SizedBox(height: 12),
                ItemTrasactionWidget(
                  concept: 'Mantenimiento',
                  amount: 1300,
                  isExpense: false,
                  date: DateTime.now(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
