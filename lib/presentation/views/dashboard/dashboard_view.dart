import 'package:cuentas_app/common/widgets/widgets.dart';
import 'package:cuentas_app/config/constants/app_constants.dart';
import 'package:flutter/material.dart';

import '../../widgets/dashboard/item_transaction_widget.dart';

class DashboardView extends StatelessWidget {
  static const name = "dashboardScreen";

  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: headerApp(context: context, title: 'Hola Jonh Smith!'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: maxSpacing,
            right: maxSpacing,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: defaultSpacing),
                const TextSection(
                  subtitle: 'En este mes',
                  headline1: 'Tu balance',
                ),
                const SizedBox(height: defaultSpacing),
                const Row(
                  children: [
                    Expanded(
                      child: TotalTransactionItemWidget(
                        isExpense: false,
                        total: 100000,
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: TotalTransactionItemWidget(
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
                      headline2: 'Transacciones',
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
                const SizedBox(height: maxSpacing),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
